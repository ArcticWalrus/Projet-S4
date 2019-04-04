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
    {values:[], labels:[]},
  ];

  private counter = 0;
  async getData(){
    let servData = await this.http.get("http://192.168.1.10/cmd/fpgaxhr").subscribe((data) => {
      console.log(data)
    });
    console.log(servData);
    if(this.counter >= 10) {
      this.speedData[0].values = this.speedData[0].values.slice(1,59);
    }
    else {
      this.speedData[0].labels.push(this.counter++);
    }
    this.speedData[0].values.push(1);
    
    console.log(this.counter);
    return this.speedData;
  }
}
