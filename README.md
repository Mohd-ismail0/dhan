# dhanda_app

Dhanda super app


Example product Detail QR

![qrcode (2)](https://user-images.githubusercontent.com/95464865/227028499-f54587fa-4a09-417e-b2e2-c161bfae5113.png)



Folder Structure :
lib/
  - core 
       - common   [this folder contains files of commonly used custom widgets]
       - constants  [this folder contains files of constanst like image const, text const ,etc]
       - enums  [this contains enum values used throughout the application]
       - providers  [this contains providers so that we donot need to initialize things again and again like firestore , auth ,etc]
       
       
  - features    [layer to separate different features like billing, online orders, auth]
       - auth [Feature 1]
       - billing [Feature 2]
          - controller  [this contains business logic of a particular feature]
          - repository   [this contains methods to communicate with firebase and other services for a particular feature]
          - screens  [this contains different screens used  for a particular feature]
          - widgets   [this contains widget components  of screens]
       - online_orders [Feature 3]
       
  - models    [all data models files here]
          
  - theme/app_theme.dart   [all theme data here]
  - routes/app_route.dart  [all route navigation releated data here]
  
