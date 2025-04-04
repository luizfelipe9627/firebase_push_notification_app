# Firebase Customer Front

## Sobre o Projeto
O **Firebase Customer Front** é um aplicativo móvel desenvolvido em **Flutter** com **Dart** que implementa notificações push utilizando **Firebase Cloud Messaging (FCM)**. O objetivo do app é permitir o envio e recebimento de mensagens em tempo real para dispositivos cadastrados.

## Tecnologias Utilizadas
- **Flutter** (Dart)
- **Firebase Cloud Messaging (FCM)**
- **Flutter Local Notifications** (para exibir notificações quando o app estiver em primeiro plano)
- **Android SDK** (para desenvolvimento e testes em dispositivos Android)

## Configuração do Projeto
### 1. Clonar o Repositório
```sh
git clone https://github.com/seu-usuario/firebase_customer_front.git
cd firebase_customer_front
```

### 2. Instalar Dependências
```sh
flutter pub get
```

### 3. Configurar Firebase
1. Acesse o [Firebase Console](https://console.firebase.google.com/).
2. Crie um novo projeto e adicione um app Android e/ou iOS.
3. Baixe o arquivo `google-services.json` (para Android) e coloque dentro da pasta `android/app/`.
4. Para iOS, adicione o arquivo `GoogleService-Info.plist` em `ios/Runner/`.

### 4. Executar o Projeto
Para rodar no emulador ou dispositivo físico:
```sh
flutter run
```

## Funcionalidades
- Solicita permissão para notificações ao iniciar o app.
- Recebe e exibe mensagens push do Firebase.
- Notificações funcionam mesmo quando o app está em segundo plano.
- Suporte a notificações locais quando o app está aberto.

## Estrutura do Código
```
/firebase_customer_front
├── lib/
├──── firebase/
│   ├── firebase_api.dart       # Integração com Firebase Messaging
├──── main.dart               # Arquivo principal do app
├── android/
│   ├── app/
│   │   ├── google-services.json # Configuração Firebase (Android)
├── ios/
│   ├── Runner/
│   │   ├── GoogleService-Info.plist # Configuração Firebase (iOS)
├── pubspec.yaml                # Dependências do Flutter
└── README.md                   # Documentação do projeto                
```

🚀 **Desenvolvido com Flutter e Firebase**

