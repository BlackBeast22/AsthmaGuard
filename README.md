# AsthmaGuard
Life-Sciences-Studienprojekt: Schätzung täglicher Asthmaereignisse anhand simulierter Umwelt- und Aktivitätsdaten mit multipler Poisson-Regression.

# AsthmaGuard

Ein Life-Sciences-Studienprojekt zur Schätzung täglicher Asthmaereignisse anhand simulierter Umwelt- und Aktivitätsdaten.

## 1. Team

- Patrick Konzbul
- Thanush Karunakaran

## 2. Projektidee

AsthmaGuard ist die Idee für eine mobile App und ein mögliches digitales Life-Sciences-Start-up. Die App soll Umwelt- und Aktivitätsdaten nutzen, um Menschen mit Asthma eine persönliche Einschätzung der erwarteten Anzahl von Asthmaereignissen pro Tag zu geben.

## 3. Problem in Life Sciences

Menschen mit Asthma können unterschiedlich auf Umweltbedingungen reagieren. Pollen, Feinstaub, Temperatur und Luftfeuchtigkeit können mit Beschwerden zusammenhängen. Betroffene können oft nur schwer einschätzen, wann ihr persönliches Risiko erhöht sein könnte. AsthmaGuard soll diese Einschätzung unterstützen.

## 4. Zentrale Idee und Funktionen

Die App führt Umwelt- und Aktivitätsdaten zusammen und schätzt daraus die erwartete Anzahl von Asthmaereignissen pro Tag.

Die Ergebnisse könnten als geschätzte Ereigniszahl oder verständliche Risikostufe angezeigt werden. Bei erhöhten Schätzungen könnte die App die Nutzerinnen und Nutzer frühzeitig informieren und so ihre Tagesplanung unterstützen.

## 5. Lösungsansatz

Für jeden Tag werden Umweltbedingungen und Aktivitäten mit der Anzahl der Asthmaereignisse verknüpft. Ein statistisches Modell untersucht, welche Kombinationen mit höheren oder niedrigeren Ereigniszahlen zusammenhängen.

In einem späteren Einsatz könnten Wetter- und Luftqualitätsdaten automatisch einbezogen werden. Für die erste Projektiteration verwenden wir ausschliesslich simulierte Daten.

## 6. Regression

Wir verwenden eine multiple Poisson-Regression.

Die Zielvariable ist die Anzahl der Asthmaereignisse pro Person und Tag. Sie besteht aus nichtnegativen Zählwerten wie 0, 1 oder 2. Deshalb wählen wir eine Poisson-Regression.

Als Prädiktoren berücksichtigen wir:

- Pollenkonzentration
- Feinstaubbelastung
- Temperatur
- Luftfeuchtigkeit
- Körperliche Aktivität
- Zeit im Freien

Das Modell schätzt die erwartete tägliche Ereigniszahl. Wir prüfen dabei die Modellannahmen, insbesondere eine mögliche Überdispersion. Da mehrere Tage derselben Person vorliegen, müssen wir auch die Abhängigkeit dieser Beobachtungen berücksichtigen.

## 7. Geplante Datensimulation

Wir planen 3'000 Beobachtungen: 100 fiktive Personen über jeweils 30 Tage. Jede Zeile entspricht einer Person an einem bestimmten Tag.

| Spalte | Bedeutung |
| --- | --- |
| personen_id | Kennung der fiktiven Person |
| tag | Beobachtungstag |
| pollen | Tägliche Pollenkonzentration |
| pm | Feinstaubbelastung |
| temperatur | Temperatur in °C |
| luftfeuchtigkeit | Relative Luftfeuchtigkeit in Prozent |
| aktive_minuten | Körperliche Aktivität in Minuten pro Tag |
| zeit_im_freien | Minuten im Freien pro Tag |
| asthmaereignisse | Anzahl der Ereignisse pro Tag; Zielvariable |

Die Simulation soll Schwankungen und beispielhafte Zusammenhänge zwischen den Einflussgrössen und der Ereigniszahl enthalten.

Die konkreten Wertebereiche, Einheiten und Modellparameter werden vor der Simulation festgelegt und mit ihrer Begründung dokumentiert.

Alle Daten sind künstlich und stellen keine medizinischen Messdaten dar.

### 7.1 Initiale Parameter-Annahmen für die Simulation

Für die erste Iteration der Datensimulation gehen wir von folgenden Wertebereichen und theoretischen Annahmen aus, die im weiteren Verlauf mit Literatur belegt werden:

| Prädiktor | Realistischer Wertebereich | Einheit | Initiale Hypothese zur Auswirkung auf die Ereigniszahl |
| :--- | :--- | :--- | :--- |
| **Pollenkonzentration** | 0 – 500 | Partikel/m³ | Ein Anstieg der Pollenkonzentration korreliert direkt mit einer Zunahme der Asthmaereignisse. |
| **Feinstaub (PM)** | 0 – 100 | µg/m³ | Höhere Feinstaubbelastung führt zu Atemwegsirritationen und steigert die erwartete Ereignisrate. |
| **Temperatur** | -10 – +35 | °C | Wahrscheinlich ein U-förmiger Zusammenhang: Sehr kalte und sehr heisse Luft reizen die Atemwege, während moderate Temperaturen neutral wirken. |
| **Luftfeuchtigkeit** | 20 – 100 | % | Sehr hohe oder sehr tiefe Werte begünstigen Ereignisse; mittlere Werte (40–60%) sind optimal. |
| **Körperliche Aktivität** | 0 – 300 | Minuten/Tag | Intensive Anstrengung kann belastungsinduziertes Asthma auslösen, besonders in direkter Kombination mit schlechter Luftqualität. |
| **Zeit im Freien** | 0 – 720 | Minuten/Tag | Wirkt als Multiplikator: Je länger die Expositionszeit im Freien, desto stärker wirken sich Pollen und Feinstaub auf die Ereigniszahl aus. |

## 8. Anwendung und Nutzen der Regression

Wir schätzen die multiple Poisson-Regression anhand der simulierten Daten. Anschliessend verwenden wir Umwelt- und Aktivitätswerte, um die erwartete Anzahl von Asthmaereignissen eines Tages zu berechnen.

Wir untersuchen, wie gut die Prognosen zu den simulierten Ereigniszahlen passen. Damit zeigen wir beispielhaft, wie aus mehreren Einflussgrössen eine Tagesprognose entstehen könnte.

Die Simulation demonstriert den methodischen Ansatz. Sie belegt keine medizinische Vorhersageleistung bei realen Personen. Die geplante App wäre eine Unterstützung und kein Ersatz für medizinische Beratung oder Behandlung.

## 9. Projektstand und Ergebnisse

Aktuell liegen die Projektidee und der Plan für die Datensimulation vor.

Folgende Inhalte werden ergänzt:

- Simulationscode und simulierte Daten
- Begründung der Simulationsparameter
- Regressionsanalyse und Prüfung der Modellannahmen
- Grafiken und Interpretation der Ergebnisse
- Einschränkungen des Modells

## 10. Vorbereitung auf das Feedback

### Verfügbarkeit für ein Online-Update mit Tugce

10.11.2026 - erste Besprechung über Teams

18.11.2026 - Pitch Idee Vortragen

### Fragen für das Feedback

1. Wie sollen wir die wiederholten Beobachtungen pro Person im Regressionsmodell berücksichtigen?
2. Wie können wir die Simulationsparameter nachvollziehbar begründen und die Grenzen der Ergebnisse angemessen darstellen?

### Herausforderungen und Einschränkungen

Die Auswahl plausibler Simulationsparameter ist eine zentrale Herausforderung. Ergebnisse aus künstlichen Daten lassen sich nicht direkt auf reale Personen übertragen. Zudem müssen mögliche Überdispersion und Unterschiede zwischen Personen berücksichtigt werden.

## 11. Beiträge der Teammitglieder

- Patrick Konzbul: Die tatsächlichen Beiträge werden im Projektverlauf detailliert ergänzt.
- Thanush Karunakaran: Die tatsächlichen Beiträge werden im Projektverlauf detailliert ergänzt.


