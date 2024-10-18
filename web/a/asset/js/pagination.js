let container = document.querySelectorAll('.pagination-container');
container.forEach(function (element) {
    let links = element.querySelectorAll('a:not(a[disabled])');
    links.forEach(function (link) {
        console.log(link)
        const url = new URL(link.href)
        for (let [k, v] of new URLSearchParams(window.location.search).entries()) {
            console.log(k,v)
            if (!url.searchParams.has(k))
                url.searchParams.set(k, v)
        }
        link.setAttribute('href', url.search);
    });
});
