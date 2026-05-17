(function () {
  function isImageHref(href) {
    if (!href) return false;
    return /(?:^data:image\/|\.)(avif|gif|jpe?g|png|svg|webp)(?:[?#].*)?$/i.test(href);
  }

  function preparePostImages(content) {
    var images = content.querySelectorAll("img");

    images.forEach(function (img) {
      var src = img.currentSrc || img.getAttribute("src");
      if (!src || src.indexOf("data:") === 0) return;

      var link = img.closest("a");
      if (link) {
        if (!content.contains(link)) return;
        if (!isImageHref(link.getAttribute("href"))) return;
      } else {
        link = document.createElement("a");
        link.href = src;
        img.parentNode.insertBefore(link, img);
        link.appendChild(img);
      }

      link.classList.add("glightbox", "js-post-lightbox");
      link.setAttribute("data-gallery", "post-images");

      var caption = (link.getAttribute("data-title") || link.getAttribute("title") || img.getAttribute("alt") || "").trim();
      if (caption && !link.getAttribute("data-title")) {
        link.setAttribute("data-title", caption);
      }
    });
  }

  function init() {
    if (typeof window.GLightbox !== "function") return;

    var content = document.querySelector(".poster");
    if (!content) return;

    preparePostImages(content);
    window.GLightbox({
      selector: ".js-post-lightbox"
    });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init, { once: true });
  } else {
    init();
  }
})();
