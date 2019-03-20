import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs'

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor() { }

  public speedData = [
    {values:[], labels:[]}
  ];

  private counter = 0;
  getData(): Observable<any>{
    setInterval(() => {
    let max = 30;
    let min = 0;
    this.speedData[0].values.push(Math.floor(Math.random()*(max-min+1)+min));
    this.speedData[0].labels.push(this.counter++);
    console.log(this.speedData);
    }, 5000);
    return of(this.speedData);
  }
}
