// if (location.pathname.match("items/new")){
  window.addEventListener("load", (e) => {
    const inputElement = document.getElementById("item_tag_name");
    inputElement.addEventListener("keyup", (e) => {
      const input = document.getElementById("item_tag_name").value;
      console.log(input)
      const xhr = new XMLHttpRequest();
      xhr.open("GET", `/items/search/?input=${input}`, true);
      xhr.responseType = "json";
      // console.log(xhr.response)
      xhr.send();
      xhr.onload = () => {
        const tagName = xhr.response.keyword;
        console.log(tagName)
        const searchResult = document.getElementById('search-result')
        searchResult.innerHTML = ''
        tagName.forEach(function(tag){

          const parentsElement = document.createElement('div')
          const childElement = document.createElement('div')

          parentsElement.setAttribute('id', 'parents')
          childElement.setAttribute('id', tag.id )
          childElement.setAttribute('class', 'child' )

          parentsElement.appendChild(childElement)
          childElement.innerHTML = tag.tag_name
          searchResult.appendChild(parentsElement)

          const clickElement = document.getElementById(tag.id)
          clickElement.addEventListener("click", () => {
            document.getElementById("item_tag_name").value = clickElement.textContent;
            clickElement.remove();
          })
        })
      }
    });
  })
//  };
