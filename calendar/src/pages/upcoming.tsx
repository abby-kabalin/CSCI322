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

function Upcoming() {
    return (
        <IonCard>
            <IonCardHeader color="warning">
                <IonCardTitle>Upcoming</IonCardTitle>
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
export default Upcoming;