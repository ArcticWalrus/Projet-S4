import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs'

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor(private http:HttpClient) { }

  public speedData = [
    {values:[], labels:[]}
  ];

  private counter = 0;
  getData(): Observable<any>{
    return this.http.get('API ici ou directement serveur');
    /* setInterval(() => {
    let max = 30;
    let min = 0;
    this.speedData[0].values.push(Math.floor(Math.random()*(max-min+1)+min));
    this.speedData[0].labels.push(this.counter++);
    console.log(this.speedData);
    }, 5000);
    return of(this.speedData); */
  }
}
