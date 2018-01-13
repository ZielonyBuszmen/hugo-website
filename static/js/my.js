// JS ES6 - pobieranie wszystkich zdjęć w artykule i dostawianie im linku do pełnego zdjęcia
const photos = document.querySelectorAll('article img');
for (const photo of photos) {
  const photoLink = photo.src;
  const link = document.createElement('a');
  link.setAttribute('href', photoLink);
  link.appendChild(photo.cloneNode(true));
  photo.parentNode.replaceChild(link, photo);
}
