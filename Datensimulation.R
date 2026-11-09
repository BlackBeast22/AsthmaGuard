# ==============================================================================
# AsthmaGuard: Prototyp der Datensimulation
# 
# Dieser erste Code-Entwurf dient als technischer "Proof of Concept".
# Er baut die grundlegende Datenstruktur auf und veranschaulicht, wie die 
# Umwelt- und Aktivitätsdaten mit der Zielvariablen zusammengeführt werden.
#
# WICHTIGE HINWEISE:
# - Dummy-Daten: Die Wertebereiche und Verteilungen (runif) sind aktuell rein 
#   zufällig gewählt, um das Tabellengerüst zu testen.
# ==============================================================================

# Dummy-Datensimulation für AsthmaGuard

set.seed(42) # Für reproduzierbare Ergebnisse im Testlauf

# 1. Definition der Dimensionen (3 Personen, 5 Tage)
n_personen <- 3
n_tage <- 5
n_gesamt <- n_personen * n_tage

# 2. Erstellung des Grundgerüsts
df_asthma <- data.frame(
  personen_id = rep(1:n_personen, each = n_tage),
  tag = rep(1:n_tage, times = n_personen)
)

# 3. Simulation der Prädiktoren basierend auf den initialen Parameter-Annahmen
df_asthma$pollen <- round(runif(n_gesamt, min = 0, max = 300))
df_asthma$pm <- round(runif(n_gesamt, min = 5, max = 50), 1)
df_asthma$temperatur <- round(runif(n_gesamt, min = -5, max = 30), 1)
df_asthma$luftfeuchtigkeit <- round(runif(n_gesamt, min = 30, max = 90))
df_asthma$aktive_minuten <- round(runif(n_gesamt, min = 0, max = 120))
df_asthma$zeit_im_freien <- round(runif(n_gesamt, min = 0, max = 300))

# 4. Simulation der Zielvariable (Asthmaereignisse) mittels Poisson-Verteilung
# Lambda (erwartete Ereignisrate) wird hier für den Dummy leicht von den Umweltfaktoren beeinflusst
# --- Einfache Notiz zur Formel ---
# 0.2 (Grundrisiko): Auch bei perfekter Luft und ohne Pollen kann man Asthma-Beschwerden haben.
# / 600 (Pollen bremsen): Ein Pollen-Wert von 500 würde in der Formel sonst 500 Asthma-Anfälle bedeuten. Das Teilen macht daraus eine kleine, realistische Zahl (z. B. 0.8).
# / 100 (Feinstaub bremsen): Genau das gleiche Prinzip. Es macht den Feinstaub-Wert klein genug, damit die Formel am Ende realistische Ergebnisse (meist 0, 1 oder 2 Anfälle pro Tag) liefert.
dummy_lambda <- 0.2 + (df_asthma$pollen / 600) + (df_asthma$pm / 100)

df_asthma$asthmaereignisse <- rpois(n_gesamt, lambda = dummy_lambda)

# 5. Anzeige der generierten Datenstruktur
print(head(df_asthma, 15))
