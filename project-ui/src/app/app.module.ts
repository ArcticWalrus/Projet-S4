import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SideMenuComponent } from './side-menu/side-menu.component';
import { DataDisplayComponent } from './data-display/data-display.component';
import { DisplaySettingsComponent } from './display-settings/display-settings.component';

@NgModule({
  declarations: [
    AppComponent,
    SideMenuComponent,
    DataDisplayComponent,
    DisplaySettingsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
