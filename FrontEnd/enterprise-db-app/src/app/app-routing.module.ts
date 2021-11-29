import { DepartmentComponent } from './pages/department/department.component';
import { SingleEmployeeViewComponent } from './pages/single-employee-view/single-employee-view.component';
import { NotFound404Component } from './pages/not-found404/not-found404.component';
import { LoginComponent } from './pages/login/login.component';
import { HomeComponent } from './pages/home/home.component';
import { MainComponent } from './omponents/main/main.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',

    component: MainComponent,
    //canActivate: [AuthGuard],
    children: [
      { path: '', component: HomeComponent },
      { path: 'department', component: DepartmentComponent },
      { path: 'viewemployee/:id', component: SingleEmployeeViewComponent } /* ,
      { path: 'viewemployee/:id', component: SingleemployeeViewComponent },
      { path: 'deleteemployee/:id', component: DeleteemployeeComponent },*/,
    ],
  },
  { path: 'login', component: LoginComponent },
  { path: '**', component: NotFound404Component },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
