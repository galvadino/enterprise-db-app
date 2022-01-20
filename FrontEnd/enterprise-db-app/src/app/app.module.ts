import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './pages/home/home.component';
import { MainComponent } from './omponents/main/main.component';
import { LoginComponent } from './pages/login/login.component';
import { NotFound404Component } from './pages/not-found404/not-found404.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { SingleEmployeeViewComponent } from './pages/single-employee-view/single-employee-view.component';
import { DepartmentComponent } from './pages/department/department.component';
import { TargetConfigComponent } from './pages/target-config/target-config.component';
import { TargetStateComponent } from './pages/target-state/target-state.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    MainComponent,
    LoginComponent,
    NotFound404Component,
    SingleEmployeeViewComponent,
    DepartmentComponent,
    TargetConfigComponent,
    TargetStateComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
