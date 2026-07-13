#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-auto}"
HOST="${HOST:-127.0.0.1}"
RUBY_PORT="${PORT:-4000}"
CONDA_ENV="${CONDA_ENV:-alfolio-local}"
CONDA_BIN="${CONDA_BIN:-}"
DOCKER_URL="${DOCKER_URL:-http://127.0.0.1:8080}"

usage() {
  cat <<'EOF'
Usage:
  bash scripts/preview_site.sh [auto|conda|ruby|docker]

Modes:
  auto    Prefer the conda environment, otherwise use the active Ruby/Bundler.
  conda   Run with conda run -n alfolio-local at http://127.0.0.1:4000.
  ruby    Run bundle exec jekyll serve locally at http://127.0.0.1:4000.
  docker  Optional fallback at http://127.0.0.1:8080.

Environment:
  CONDA_ENV=my-env bash scripts/preview_site.sh conda
  CONDA_BIN=/path/to/conda bash scripts/preview_site.sh conda
  PORT=5000 bash scripts/preview_site.sh ruby
  HOST=0.0.0.0 bash scripts/preview_site.sh ruby
EOF
}

has_command() {
  command -v "$1" >/dev/null 2>&1
}

print_header() {
  printf '\n==> %s\n' "$1"
}

find_conda() {
  if [ -n "${CONDA_BIN}" ] && [ -x "${CONDA_BIN}" ]; then
    printf '%s\n' "${CONDA_BIN}"
    return 0
  fi

  if has_command conda; then
    command -v conda
    return 0
  fi

  if [ -x "${HOME}/miniconda3/bin/conda" ]; then
    printf '%s\n' "${HOME}/miniconda3/bin/conda"
    return 0
  fi

  if [ -x "${HOME}/anaconda3/bin/conda" ]; then
    printf '%s\n' "${HOME}/anaconda3/bin/conda"
    return 0
  fi

  return 1
}

conda_env_exists() {
  local conda_path="$1"
  "${conda_path}" env list | awk '{print $1}' | grep -qx "${CONDA_ENV}"
}

run_conda_preview() {
  local conda_path
  if ! conda_path="$(find_conda)"; then
    echo "Conda is not installed or not on PATH."
    echo "Set CONDA_BIN=/path/to/conda, or run: bash scripts/preview_site.sh ruby"
    exit 1
  fi

  if ! conda_env_exists "${conda_path}"; then
    echo "Conda environment '${CONDA_ENV}' was not found."
    echo "Set CONDA_ENV=<your-env>, or create the environment first."
    exit 1
  fi

  print_header "Checking conda Ruby dependencies"
  if ! "${conda_path}" run -n "${CONDA_ENV}" bundle check >/dev/null 2>&1; then
    echo "Missing Ruby gems in conda environment '${CONDA_ENV}'."
    echo "Run: ${conda_path} run -n ${CONDA_ENV} bundle install"
    exit 1
  fi

  print_header "Starting conda preview"
  echo "Conda env: ${CONDA_ENV}"
  echo "Local URL: http://${HOST}:${RUBY_PORT}/"
  echo "Hot update: most content changes rebuild automatically; refresh if LiveReload does not fire."
  echo "Stop: press Ctrl+C in this terminal."
  echo

  "${conda_path}" run --no-capture-output -n "${CONDA_ENV}" \
    bundle exec jekyll serve \
      --watch \
      --livereload \
      --host "${HOST}" \
      --port "${RUBY_PORT}" \
      --trace
}

run_docker_preview() {
  if ! has_command docker; then
    echo "Docker is not installed or not on PATH."
    exit 1
  fi

  print_header "Starting Docker preview"
  echo "Local URL: ${DOCKER_URL}"
  echo "Hot update: edit files, then wait a few seconds for Jekyll to rebuild."
  echo "Stop: press Ctrl+C in this terminal."
  echo

  docker compose up
}

run_ruby_preview() {
  if ! has_command bundle; then
    echo "Bundler is not installed or not on PATH."
    echo "Install Ruby/Bundler dependencies first, or run: bash scripts/preview_site.sh docker"
    exit 1
  fi

  print_header "Checking Ruby dependencies"
  if ! bundle check >/dev/null 2>&1; then
    echo "Missing gems. Run 'bundle install' first, or use Docker mode."
    exit 1
  fi

  print_header "Starting local Ruby preview"
  echo "Local URL: http://${HOST}:${RUBY_PORT}/"
  echo "Hot update: most content changes rebuild automatically; refresh if LiveReload does not fire."
  echo "Stop: press Ctrl+C in this terminal."
  echo

  bundle exec jekyll serve \
    --watch \
    --livereload \
    --host "${HOST}" \
    --port "${RUBY_PORT}" \
    --trace
}

case "${MODE}" in
  -h|--help|help)
    usage
    ;;
  auto)
    if conda_path="$(find_conda)" && conda_env_exists "${conda_path}"; then
      run_conda_preview
    else
      run_ruby_preview
    fi
    ;;
  conda)
    run_conda_preview
    ;;
  docker)
    run_docker_preview
    ;;
  ruby)
    run_ruby_preview
    ;;
  *)
    echo "Unknown mode: ${MODE}"
    usage
    exit 1
    ;;
esac
