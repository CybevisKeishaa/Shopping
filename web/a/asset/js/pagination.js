let pcontainer = document.querySelectorAll('.pagination-container');
pcontainer.forEach(function (element) {
    let links = element.querySelectorAll('a:not(a[disabled])');
    links.forEach(function (link) {
        const url = new URL(link.href)
        for (let [k, v] of new URLSearchParams(window.location.search).entries()) {
            if (!url.searchParams.has(k))
                url.searchParams.set(k, v)
        }
        link.setAttribute('href', url.search);
    });
});
