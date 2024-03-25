import React from 'react';
import { IonButton, IonIcon, IonRow, IonSearchbar } from '@ionic/react';
import { addOutline, filterCircleOutline } from 'ionicons/icons';



function Buttons() {
    return (
        <IonRow class="ion-justify-content-around">
            <IonButton shape="round" color="secondary">
                <IonIcon icon={addOutline} />
                Event</IonButton>
            <IonButton shape="round" color="tertiary">
                <IonIcon icon={addOutline} />
                Deadline</IonButton>
            <IonButton shape="round" color="primary">
                <IonIcon icon={addOutline} />
                Personal</IonButton>
            <IonButton shape="round" color="success">
                <IonIcon icon={filterCircleOutline} />
                <IonSearchbar autocapitalize='on' placeholder='Filter' showClearButton="focus"></IonSearchbar>
                Filter</IonButton>
        </IonRow>
    );
}
export default Buttons;