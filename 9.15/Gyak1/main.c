#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("Hello world!\n");
    return 0;
}

void p1(){
    FILE *fp;
    char ch;
    char fnev[5];
    printf("Filenev: ");
    scanf("%s", fnev);
    fp = fopen(fnev, "w");
    printf("Üzenet ");
    while((ch = getchar()) != '#'){
        putc(ch, fp);
    }
    fclose(fp);

    fp = fopen(fnev, "r");
    while((ch = getc(fp)) != EOF){
        printf("%c", ch);

    }
    fclose(fp);
    return 0;
}

void p2(char fn1, char fn2){
    FILE *fp1, *fp2;
    char ch;
    int pos;

    if((fp1 = fopen(fnev1, "r")) == NULL){
        printf("\nNem lehet a filet megnyitni");
        return;
    }
    else{
        printf("\nFile megnyitva\n");
    }

    fp2 = fopen(fnev2, "w");
    fseek(fp1, 0L, SEEK_END);
    pos = ftell(fp1);
    fseek(fp1, 0L, SEEK_SET);
    while(pos--){
        ch = fgetc(fp1);
        fputc(ch, fp2);
    }
    fclose(fp1);
    fclose(fp2);
}

struct Auto{
    char rendszam[6];
    char tipus[20];
    double ar;
};

void p3_1(){
    struct Auto autok[3];
    FILE *fdata;
    int i = 0;

    for(i=0;i<3;i++){
        printf("rsz: ");
        scanf("%s", &autok[i].rendszam);
        printf("tipus: ");
        scanf("%s", &autok[i].tipus);
        printf("ar: ");
        scanf("%d", &autok[i].ar);
    }

    fdata = fopen("Autok.dat", "wb");

    for (i=0; i< 3; i++) {
        fwrite(&(autok[i]), sizeof(struct Auto),1, fdata);
    }

    fclose(fdata);
}

    void p3_2(int poz){

        FILE *fdata;

        fdata = fopen("Autok.dat", "rb");
        struct Auto aurek;

        if (fdata == NULL) {
            printf ("file hiba\n");
            return;
        }

        fseek(fdata, (poz-1)* sizeof(struct Auto),0 );
        fread(&aurek, sizeof(struct Auto),1, fdata);

        printf ("rsz: %s\n", aurek.rendszam);
        printf ("tip: %s\n", aurek.tipus);
        printf ("ar: %d\n", aurek.ar);

        fclose(fdata);
    }

int p4() {
    FILE *fp1, *fp2;

    char fajlnev[40];
    char c;
    int torlendo_sor, atmeneti = 1;

    printf("Fajlnev megadasa: ");

    scanf("%s", fajlnev);

    fp1 = fopen(fajlnev, "r");
    c = getc(fp1);

    while (c != EOF){
        printf("%c", c);

        c = getc(fp1);
    }

    rewind(fp1);
    printf(" \n Ird be a torolni kivant sor szamat:");
    scanf("%d", &torlendo_sor);

    fp2 = fopen("masolat.c", "w");
    c = getc(fp1);

    while (c != EOF) {
        c = getc(fp1);
        if (c == '\n')
            atmeneti++;

        if (atmeneti != torlendo_sor){
            putc(c, fp2);
        }
    }

    fclose(fp1);
    fclose(fp2);

    remove(fajlnev);

    rename("masolat.c", fajlnev);
    printf("\n A modositas utan a fajl tartalma a kovetkezo:\n");
    fp1 = fopen(fajlnev, "r");
    c = getc(fp1);
    while (c != EOF) {
        printf("%c", c);
        c = getc(fp1);
    }
    fclose(fp1);
    return 0;
}

void rendezes(){
    FILE *fdata, *fdatauj;
    struct Auto aurek, baurek;
    int optar, limit, db;

    fdata = fopen("Autok.dat", "rb");
    fdatauj = fopen("Autok_2.dat", "wb");

    limit = 0;
    db = 1;

    while (db > 0){
        fseek(fdata,0,0);
        db = 0;
        optar = 10000;

        while (!feof(fdata)) {

            fread(&aurek, sizeof(struct Auto),1, fdata);

            if ((aurek.ar < optar) && (aurek.ar > limit) ) {
                optar = aurek.ar;
                strcpy(&baurek.rendszam, aurek.rendszam);
                baurek.ar = aurek.ar;
                strcpy(&baurek.tipus, aurek.tipus);
                db = 1;
            }
        }

        if (db > 0) {
            limit = baurek.ar;
            fwrite(&baurek, sizeof(struct Auto),1, fdatauj);
        }
    }

    fclose(fdata);
    fclose(fdatauj);

    printf("--------------------------------\n");

    fdata = fopen("Autok_2.dat", "rb");

    while (!feof(fdata)) {
        fread(&aurek, sizeof(struct Auto),1, fdata);
        printf ("%s %s %d\n",aurek.rendszam,aurek.tipus, aurek.ar);
    }

    fclose(fdata);
}



