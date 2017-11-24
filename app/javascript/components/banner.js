import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Learn to make cocktails", "Drink them with moderation"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
