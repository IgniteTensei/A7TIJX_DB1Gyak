#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("Hello world!\n");
    return 0;
}

public void hf1 () {

    String sor;
    String[] szavak;

    int sorid = 0 ;

    try {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = null;

        while ( sorid >= 0) {
            sor = br.readLine();

            if (sorid == 0) {
                bw = new BufferedWriter(new FileWriter(sor));
            }
            else {
                bw.write(sor);
                bw.newLine();
            }
            sorid = sorid + 1;
            szavak = sor.split(" ");

            for (String sz : szavak){
                System.out.println(sz+":");
                if (sz.compareTo("end") == 0 ) {
                    br.close();
                    sorid = -1;
                }
            }
        }

        bw.close();
        System.out.println("Ok");
    }

    catch (Exception ee){
    ee.printStackTrace();
    }

}

public void hf2 (String fnev) {

    String sor;
    String[] szavak;
    int sorid = 0 ;

    try {

        BufferedReader br = new BufferedReader(new FileReader(fnev));

        while ( (sor = br.readLine()) != null) {
            System.out.println(sor.toUpperCase());
        }

        br.close();
        System.out.println("Ok");

    }
    catch (Exception ee){
        ee.printStackTrace();
    }
}

public void hf3 (String fnevbe, String fnevki) {

    String sor;

    String[] szavak;
    String[] k1 = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
    String[] k2 = { " egy ", " kettõ ", " három ", " négy ", " öt ", " hat ", " hét ", "nyolc ", "kilenc ", " nulla" };

    int sorid = 0 ;

    try {

        BufferedWriter bw = new BufferedWriter(new FileWriter(fnevki));
        BufferedReader br = new BufferedReader(new FileReader(fnevbe));

        while ( (sor = br.readLine()) != null) {

            for (int i=0; i<10; i++){
                sor = sor.replace(k1[i],k2[i]);
            }

            bw.write(sor);
            bw.newLine();
        }

        br.close();
        bw.close();
        System.out.println("Ok");

    }
    catch (Exception ee){
        ee.printStackTrace();
    }
}

public class Auto implements Serializable {

    private static final long serialVersionUID = 1L;
    String rsz;
    String tipus;
    int ar;

    public Auto (String r, String t, int a){
        this.rsz = r;
        this.tipus = t;
        this.ar = a;
    }
}

public void hf4 () {

    String sor;
    Auto[] autoim = {new Auto("R11","Opel",333),new Auto("R12","Fiat",233),
    new Auto("R14","Skoda",364)};
    try {

        ObjectOutputStream kifile = new ObjectOutputStream(
            new FileOutputStream ("Autok.dat")
        );

        for (Auto auto : autoim) {
            kifile.writeObject(auto);
        }
        kifile.close();
    }
    catch (Exception e) {

        e.printStackTrace();
        System.out.println ("File nyitasi hiba");
    }
    System.out.println ("OK");
}

public void hf5 () {

    String sor;
    Auto ma;
    try {
        File fn = new File("Autok.dat");
        if (fn.exists()) {

            ObjectInputStream kifile = new ObjectInputStream(new FileInputStream ("Autok.dat"));

            try {
                while (true) {
                    ma = (Auto) kifile.readObject();

                    if (ma.ar > 300) {
                        System.out.println("rendszam=" + ma.rsz);
                    }
                }
            }
            catch (EOFException ee){
                ma = null;
            }

            kifile.close();
        }
    }
    catch (Exception e) {
        e.printStackTrace();
        System.out.println ("File nyitasi hiba");
    }

    System.out.println ("OK2");
}
