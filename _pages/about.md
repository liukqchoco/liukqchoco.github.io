---
layout: about
title: About
permalink: /
subtitle:

profile:
  align: right
  image: profile.jpg
  image_circular: false # crops the image to make it circular
  more_info:

selected_papers: true # includes a list of papers marked as "selected={true}"
social: false # the contact icons are placed manually below the intro

announcements:
  enabled: true # includes a list of news items
  scrollable: true # adds a vertical scroll bar if there are more than 3 news items
  limit: 5 # leave blank to include all the news in the `_news` folder

latest_posts:
  enabled: false
  scrollable: true # adds a vertical scroll bar if there are more than 3 new posts items
  limit: 3 # leave blank to include all the blog posts
---

<style>
  .post article {
    font-size: 1.08rem;
    line-height: 1.62;
  }

  .post article > .profile.float-right {
    width: 205px !important;
    max-width: 24%;
    margin-left: 2.25rem;
    margin-bottom: 1rem;
  }

  .profile-email {
    margin-top: 0.95rem;
    text-align: center;
    font-size: 1.12rem;
    line-height: 1;
  }

  .profile-email-pill {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 0.55rem;
    padding: 0.55rem 1.05rem;
    border: 1px solid var(--global-divider-color, rgba(0, 0, 0, 0.14));
    border-radius: 999px;
    box-shadow: 0 4px 14px rgba(0, 0, 0, 0.05);
    color: var(--global-text-color);
    user-select: text;
  }

  .profile-email i {
    color: var(--global-theme-color);
    font-size: 1.16rem;
  }

  .news table {
    font-size: 1.06rem;
  }

  .publications .title {
    font-size: 1.18rem;
  }

  .publications .author,
  .publications .periodical {
    font-size: 1.12rem;
  }

  .publications .publication-note {
    display: inline-block;
    padding: 0.12rem 0.45rem;
    border-radius: 0.45rem;
    background: rgba(181, 9, 172, 0.08);
    color: var(--global-theme-color);
    font-size: 1.02rem;
    font-weight: 700;
    margin-top: 0.25rem;
  }

  .publications ol.bibliography li {
    margin-bottom: 1rem;
  }

  .publications ol.bibliography li .row {
    align-items: flex-start;
  }

  .publications ol.bibliography li .abbr {
    flex: 0 0 21%;
    max-width: 21%;
    padding-right: 1.4rem;
  }

  .publications ol.bibliography li .abbr .badge {
    font-size: 0.9rem;
    margin-bottom: 0.55rem;
  }

  .publications ol.bibliography li .abbr .preview {
    width: 100%;
    max-width: 180px;
  }

  .publications ol.bibliography li .row > div[id] {
    flex: 0 0 76%;
    max-width: 76%;
  }

  .education-list {
    display: flex;
    flex-direction: column;
    gap: 2.4rem;
    margin: 0.5rem 0 2.25rem;
  }

  .education-item {
    display: grid;
    grid-template-columns: 245px minmax(0, 1fr);
    column-gap: 3.75rem;
    align-items: center;
  }

  .education-logo {
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .education-logo img {
    max-width: 225px;
    max-height: 100px;
    object-fit: contain;
  }

  .education-logo img.pku-logo {
    max-width: 235px;
    max-height: 106px;
  }

  .education-school {
    font-size: 1.28rem;
    font-weight: 700;
    line-height: 1.25;
  }

  .education-date {
    font-size: 1.14rem;
    color: var(--global-text-color);
    margin-top: 0.1rem;
  }

  .education-degree {
    font-size: 1.14rem;
    font-weight: 700;
    margin-top: 0.85rem;
  }

  .education-meta {
    font-size: 1.08rem;
    line-height: 1.45;
  }

  .experience-list {
    margin: 0.5rem 0 2.25rem;
  }

  .experience-item {
    display: grid;
    grid-template-columns: 245px minmax(0, 1fr);
    column-gap: 3.75rem;
    align-items: center;
  }

  .experience-logo {
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .experience-logo img {
    max-width: 190px;
    max-height: 64px;
    object-fit: contain;
  }

  .experience-date {
    font-size: 1.14rem;
    color: var(--global-text-color);
  }

  .experience-role {
    font-size: 1.14rem;
    margin-top: 0.25rem;
  }

  .experience-team {
    font-size: 1.14rem;
    font-weight: 700;
    margin-top: 0.25rem;
  }

  .experience-meta {
    font-size: 1.08rem;
    line-height: 1.5;
    margin-top: 0.3rem;
  }

  .achievement-list {
    display: flex;
    flex-direction: column;
    gap: 0.45rem;
    margin: 0.35rem 0 2.25rem;
  }

  .achievement-item {
    display: grid;
    grid-template-columns: 7.2rem minmax(0, 1fr);
    column-gap: 1.25rem;
    align-items: baseline;
    line-height: 1.45;
  }

  .achievement-date {
    font-weight: 700;
    color: var(--global-text-color);
    white-space: nowrap;
  }

  .achievement-content {
    min-width: 0;
  }

  .publication-inline-links {
    font-size: 1.12rem;
  }

  .publication-inline-links a {
    color: var(--global-theme-color);
  }

  .publication-inline-links a:hover {
    text-decoration: underline;
  }

  .publication-link-separator {
    margin: 0 0.25rem;
    color: var(--global-text-color);
  }

  @media (max-width: 575.98px) {
    .post article > .profile.float-right {
      width: 68% !important;
      max-width: 260px;
      margin: 0 auto 1.5rem;
      float: none !important;
    }

    .education-item {
      grid-template-columns: 126px minmax(0, 1fr);
      column-gap: 1rem;
    }

    .education-logo img {
      max-width: 118px;
      max-height: 72px;
    }

    .education-logo img.pku-logo {
      max-width: 122px;
      max-height: 74px;
    }

    .experience-item {
      grid-template-columns: 126px minmax(0, 1fr);
      column-gap: 1rem;
    }

    .experience-logo img {
      max-width: 118px;
      max-height: 52px;
    }

    .achievement-item {
      grid-template-columns: 5.8rem minmax(0, 1fr);
      column-gap: 0.8rem;
    }

    .publications ol.bibliography li .abbr,
    .publications ol.bibliography li .row > div[id] {
      flex: 0 0 100%;
      max-width: 100%;
    }

    .publications ol.bibliography li .abbr {
      padding-right: 15px;
      margin-bottom: 0.75rem;
    }

    .publications ol.bibliography li .abbr .preview {
      max-width: 220px;
    }
  }
</style>

I am a first-year Ph.D. student at **[Peking University](https://english.pku.edu.cn/)**, advised by Prof. [Boxin Shi](https://camera.pku.edu.cn/) in the Camera Intelligence Lab (CI Lab).
Prior to this, I received my B.E. in Software Engineering from **[Nanjing University](https://www.nju.edu.cn/en/)** with honors, with GPA ranked 1/216 (top 0.5%).

**Research Interests**

- **Generative AI (AIGC):** Controllable Video Generation, Multi-Shot Video Generation, Audio-Visual Generation, and Multimodal Evaluation.
- **World Models (WM):** Interactive World Models, Autoregressive Long Video Generation, Memory-Augmented Modeling.
- **Unified Understanding and Generation Models (UMM):** Unified Image and Video Understanding and Generation, New Unified Video Generation Architectures.

**Feel free to reach out! I’m always open to research collaborations and discussions! ✨**
