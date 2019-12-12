import { Injectable, NgZone } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SseService {

  constructor(private zone: NgZone) { }

  observe<T>(sseUrl: string): Observable<T> {
    return new Observable<any>(obs => {
      const es = new EventSource(sseUrl);
      es.onmessage = evt => {
        const data = JSON.parse(evt.data); // TODO handle parse error
        this.zone.run(() => obs.next(data));
      };
      return () => es.close();
    });
  }
}
