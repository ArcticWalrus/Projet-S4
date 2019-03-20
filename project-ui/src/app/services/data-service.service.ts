import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor() { }

  getData(){
    let max = 15;
    let min = 0;
    return (Math.floor(Math.random()*(max-min+1)+min));
  }
}
