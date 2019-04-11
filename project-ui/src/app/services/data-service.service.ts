import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs'
import { ServerData } from './../models/server-data';

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
  public distanceData;
  public calorieData;

  private counter = 0;
  getData() {
    this.http.get("http://192.168.1.10/cmd/fpgaxhr").subscribe((data: ServerData) => {
      this.speedData[0].values.push(data.Vitesse);
      this.distanceData = data.Distance;
      this.calorieData = data.Calorie;
      /* console.log(data.Vitesse);
      console.log(data.Distance);
      console.log(data.Calorie); */
    });
    if(this.counter >= 60) {
      this.speedData[0].values = this.speedData[0].values.slice(1,59);
    }
    else {
      this.speedData[0].labels.push(this.counter++);
    }
    return this.speedData;
  };

  
  getDistance() {
    return this.distanceData;
  }

  getCalorie() {
    return this.calorieData;
  }

  postPoids(poids: number){
    this.http.post("http://192.168.1.10/cmd/fpgaxhr", poids, httpOptions);
  }

}
