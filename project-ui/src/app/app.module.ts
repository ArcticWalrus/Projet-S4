import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';

import { MatSidenavModule } from '@angular/material/sidenav';
import { MatButtonModule } from '@angular/material/button';

import { ChartsModule } from 'ng2-charts';

import { AppComponent } from './app.component';
import { SideMenuComponent } from './side-menu/side-menu.component';
import { DataDisplayComponent } from './data-display/data-display.component';
import { DisplaySettingsComponent } from './display-settings/display-settings.component';
import { MainDisplayComponent } from './main-display/main-display.component';

@NgModule({
  declarations: [
    AppComponent,
    SideMenuComponent,
    DataDisplayComponent,
    DisplaySettingsComponent,
    MainDisplayComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,

    MatSidenavModule,
    MatButtonModule,

    ChartsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
