import { Controller } from "stimulus"
import Rails from "@rails/ujs"


export default class extends Controller {

    static targets = [ "email" ];


    add(event) {

        event.preventDefault();

        let email = this.emailTarget.value.trim();
        let formdata = new FormData();
        formdata.append("subscribe[email]", email)

        //console.log(formdata);

        Rails.ajax({
            
            url:'/api/v1/subscribe',
            type: 'POST',
            dataType: 'json',
            data: formdata,

            success: (response) =>{
                
                switch(response.status){
                    case 'OK':
                        alert("感謝訂閱！");
                        break;
                    case 'Duplicated':
                        alert(`${response.email}已經訂閱過了哦！`);
                        break;
                }
                console.log(response);
                this.emailTarget.value='';

            },

            error: (err)=>{
                alert(err);
            },

        });


    }
    
}