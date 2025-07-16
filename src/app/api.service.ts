import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  constructor(private http: HttpClient) {}

  ping$(): Observable<any> {
    // No API needed - just return a mock response
    return of({
      msg: 'Frontend-only app - no API calls needed!',
    });
  }
}
