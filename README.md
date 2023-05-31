# LX Helm Charts

## Przeznaczenie
Repozytorium zawierające kody źródłowe Helm Chartów wytwarzanych dla aplikacji przez domeny.  

## Zasady wprowadzania zmian
Repozytorium jest w fazie rozwojowej. Obecnie obowiązują następujące zasady:
- branch main jest chroniony
- zmiany w branchu main wprowadzamy przez pull requesty z innych branchy
- dodajemy tylko poprawne (brak błędów przy lint) Helm Charty.
- Helm Charty dodajemy w folderze własnej domeny

## Struktura repo
```
.
├── charts			# folder z Chartami
│   ├── PROSTo			# folder domeny PROSTo
│   │   └── jakas-apka		# przykładowy Helm Chart
│   │       ├── charts
│   │       ├── Chart.yaml
│   │       ├── .helmignore
│   │       ├── templates
│   │       └── values.yaml
│   └── README.md		# info o organizacji plików w folderze charts
├── .github
│   └── workflows
│       └── validate.yaml	# workflow chorniący branch "main"
├── README.md			# Jesteś tutaj ;)
└── .scripts
    └── validators
        └── render.sh		# skrypt walidujący Helm Charty
```

## Walidacja
Każdy pull request uruchamia skrypt `.scripts/validators/render.sh`. Skrypt działa w następujący sposób:
- rekursywnie wyszukuje plików `Chart.yaml` w folderze `charts`
- zakłada że każdy folder z plikiem `Chart.yaml` to źródła paczki Helm Chart
- wykonuje `helm lint` na każdym Helm Chart
- kończy się błędem, jeśli chodziaż jeden Helm Chart zawiera błędy

Pull requesty do brancha `main` wymagają walidacji zakończonej sukcesem.
