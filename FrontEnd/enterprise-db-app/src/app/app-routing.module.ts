import { TargetStateComponent } from './pages/target-state/target-state.component';
import { TargetConfigComponent } from './pages/target-config/target-config.component';
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
      { path: 'viewemployee/:id', component: SingleEmployeeViewComponent },
      { path: 'targetconfig', component: TargetConfigComponent },
      { path: 'targetstate', component: TargetStateComponent },
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
