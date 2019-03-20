import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor() { }

  public speedData: number[] =[];

  getData(){
    let max = 30;
    let min = 0;
    this.speedData.push(Math.floor(Math.random()*(max-min+1)+min))
    return (this.speedData);
  }
}
