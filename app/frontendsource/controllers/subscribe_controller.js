import { Controller } from "stimulus"

export default class extends Controller {

    static targets = [ "email" ];


    add(event) {

        event.preventDefault();

        let email = this.emailTarget.value.trim();

        console.log(email);
    }
    
}