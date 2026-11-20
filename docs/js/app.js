(function(){
  var links=[].slice.call(document.querySelectorAll('.nav a'));
  var map={};links.forEach(function(a){map[a.getAttribute('href').slice(1)]=a;});
  if('IntersectionObserver' in window&&!/[?&]static\b/.test(location.search)){
    var io=new IntersectionObserver(function(es){es.forEach(function(e){
      if(e.isIntersecting&&map[e.target.id]){links.forEach(function(l){l.removeAttribute('aria-current');});map[e.target.id].setAttribute('aria-current','true');}
    });},{rootMargin:'-45% 0px -50% 0px'});
    Object.keys(map).forEach(function(id){var s=document.getElementById(id);if(s)io.observe(s);});
    if(document.documentElement.classList.contains('anim')){
      var ro=new IntersectionObserver(function(es){es.forEach(function(e){if(e.isIntersecting){e.target.classList.add('in');ro.unobserve(e.target);}});},{rootMargin:'0px 0px -8% 0px'});
      document.querySelectorAll('.band .wrap > *').forEach(function(el){el.classList.add('rv');ro.observe(el);});
    }
  }
})();
