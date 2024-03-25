import {
    IonCard,
    IonCardContent,
    IonCardHeader,
    IonCardSubtitle,
    IonCardTitle,
    IonItem,
    IonLabel,
    IonList,
    IonThumbnail,
    IonCheckbox,
} from '@ionic/react';

import './main.css';

function Important() {
    return (
        <IonCard>
            <IonCardHeader color="danger">
                <IonCardTitle>Important</IonCardTitle>
                <IonCardSubtitle></IonCardSubtitle>
            </IonCardHeader>
            <IonCardContent>
                <IonList>
                    <IonItem>
                        <IonCheckbox labelPlacement="end" style={{ whiteSpace: 'normal' }}>Label at the End</IonCheckbox>
                    </IonItem>

                    <IonItem>
                        <IonCheckbox labelPlacement="end" style={{ whiteSpace: 'normal' }}>Label at the End</IonCheckbox>
                    </IonItem>

                    <IonItem>
                        <IonCheckbox labelPlacement="end" style={{ whiteSpace: 'normal' }}>Label at the End</IonCheckbox>
                    </IonItem>

                    <IonItem>
                        <IonCheckbox labelPlacement="end" style={{ whiteSpace: 'normal' }}>Label at the End</IonCheckbox>
                    </IonItem>
                </IonList>
            </IonCardContent>
        </IonCard>
    );
}
export default Important;