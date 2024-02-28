const btn = document.querySelector('.buyBtn')

btn.onmousemove = function (e) {
  const x = e.pageX - btn.offsetLeft
  const y = e.pageY - btn.offsetTop
  
  btn.style.setProperty('--x', x + 'px')
  btn.style.setProperty('--y', y + 'px')
}





document.addEventListener('DOMContentLoaded', function() {
    var eventTopButton = document.querySelector('.eventTop');
    eventTopButton.style.display = 'none';
});

window.addEventListener('scroll', function() {
    var scrollPercentage = (document.documentElement.scrollTop + document.body.scrollTop) / 
                           (document.documentElement.scrollHeight - document.documentElement.clientHeight) * 100;

    if (scrollPercentage > 10) {
        var eventTopButton = document.querySelector('.eventTop');
        eventTopButton.style.display = 'block';
    } else {
        var eventTopButton = document.querySelector('.eventTop');
        eventTopButton.style.display = 'none';
    }
});