import Sortable from 'sortablejs';

document.addEventListener("turbolinks:load", ()=> {

    let element = document.querySelector(".sortable-items");
   
   if(element){
       let sortable = new Sortable(element, {
        animation: 150,
        ghostClass: 'blue-background-class',

        onEnd: (event) =>{
           
           //console.log(event.item.dataset.item);
           let [model, id] = event.item.dataset.item.split('_');

           console.log(model, id);
        }

       });
   }

   
    // console.log(element);


})