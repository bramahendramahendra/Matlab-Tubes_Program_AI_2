dataEmosi = fuzzydata(:,1);
dataProvokasi = fuzzydata(:,2);

for k = 1:length(dataProvokasi)
    emosi = dataEmosi(k,1);
    provokasi = dataProvokasi(k,1);
    i = 1;
    j = 1;
    Emosi_keci = 0;
    Emosi_Sedang = 0;
    Emosi_Besar = 0;

    provokasi_Rendah = 0;
    provokasi_Biasa = 0;
    provokasi_Tinggi = 0;
    provokasi_SangatTinggi = 0;

    %fungsi EMOSI
    if emosi >= 0 && emosi <= 35
        Emosi_keci = 1;
    elseif emosi > 35 && emosi < 45 
        Emosi_keci = (45-emosi)/(45-35);
        Emosi_Sedang = (emosi-35)/(45-35);
    elseif emosi >= 45 && emosi <= 65
        Emosi_Sedang = 1;
    elseif emosi > 65 && emosi < 70
        Emosi_Sedang = (70-emosi)/(70-65);
        Emosi_Besar = (emosi-65)/(70-65);
    elseif emosi >=70 && emosi <= 100
        Emosi_Besar = 1;
    end;


    if provokasi >= 0 && provokasi <= 30
        provokasi_Rendah = 1;
    elseif provokasi > 30 && provokasi < 40 
        provokasi_Rendah = (40-provokasi)/(40-30);
        provokasi_Biasa = (provokasi-30)/(40-30);
    elseif provokasi >= 40 && provokasi <= 57
        provokasi_Biasa = 1;
    elseif provokasi > 57 && provokasi < 67
        provokasi_Biasa = (67-provokasi)/(67-57);
        provokasi_Tinggi = (provokasi-57)/(67-57);
    elseif provokasi >=67 && provokasi <= 80
        provokasi_Tinggi = 1;
    elseif provokasi > 80 && provokasi <= 95
        provokasi_Tinggi = (80-provokasi)/(95-80);
        provokasi_SangatTinggi = (provokasi-80)/(95-80);
    elseif provokasi >= 80 && provokasi <= 100
        provokasi_SangatTinggi = 1; 
    end;


    Ya = [0,0,0,0,0,0];
    Tidak = [0,0,0,0,0,0];

    if provokasi_Rendah ~= 0 && Emosi_keci ~= 0
        if provokasi_Rendah <= Emosi_keci 
            Tidak(i) = provokasi_Rendah;
            i = i+1;
        else
            Tidak(i)= Emosi_keci;
            i = i+1;
        end;
    end;
    if provokasi_Rendah ~= 0 && Emosi_Sedang ~= 0
        if provokasi_Rendah <= Emosi_Sedang
            Tidak(i) = provokasi_Rendah;
            i = i+1;
        else 
            Tidak(i)= Emosi_Sedang;
            i = i+1;
        end;
    end;
    if provokasi_Rendah ~= 0 && Emosi_Besar ~= 0
        if provokasi_Rendah <= Emosi_Besar 
            Tidak(i) = provokasi_Rendah;
            i = i+1;
        else
            Tidak(i)= Emosi_Besar;
            i = i+1;
        end;
    end;

    if provokasi_Biasa ~= 0 && Emosi_keci ~= 0
        if provokasi_Biasa <= Emosi_keci 
            Ya(j) = provokasi_Biasa;
            j = j+1;
        else
            Ya(j)= Emosi_keci;
            j = j+1;
        end;
    end;
    if provokasi_Biasa ~= 0 && Emosi_Sedang ~= 0
        if provokasi_Biasa <= Emosi_Sedang 
            Tidak(i) = provokasi_Biasa;
            i = i+1;
        else
            Tidak(i)= Emosi_Sedang;
            i = i+1;
        end;
    end;
    if provokasi_Biasa ~= 0 && Emosi_Besar ~= 0
        if provokasi_Biasa <= Emosi_Besar 
            Tidak(i) = provokasi_Biasa;
            i = i+1;
        else
            Tidak(i)= Emosi_Besar;
            i = i+1;
        end;
    end;

    if provokasi_Tinggi ~= 0 && Emosi_keci ~= 0
        if provokasi_Tinggi <= Emosi_keci 
            Ya(j) = provokasi_Tinggi;
            j = j+1;
        else
            Ya(j)= Emosi_keci;
            j = j+1;
        end;
    end;
    if provokasi_Tinggi ~= 0 && Emosi_Sedang ~= 0
        if provokasi_Tinggi <= Emosi_Sedang 
            Tidak(i) = provokasi_Tinggi;
            i = i+1;
        else
            Tidak(i)= Emosi_Sedang;
            i = i+1;
        end;
    end;
    if provokasi_Tinggi ~= 0 && Emosi_Besar ~= 0
        if provokasi_Tinggi <= Emosi_Besar 
            Ya(j) = provokasi_Tinggi;
            j = j+1;
        else
            Ya(j)= Emosi_Besar;
            j = j+1;
        end;
    end;

    if provokasi_SangatTinggi ~= 0 && Emosi_keci ~= 0
        if provokasi_SangatTinggi <= Emosi_keci 
            Ya(j) = provokasi_SangatTinggi;
            j = j+1;
        else
            Ya(j)= Emosi_keci;
            j = j+1;
        end;
    end;
    if provokasi_SangatTinggi ~= 0 && Emosi_Sedang ~= 0
        if provokasi_Tinggi <= Emosi_Sedang 
            Ya(j) = provokasi_SangatTinggi;
            j = j+1;
        else
            Ya(j)= Emosi_Sedang;
            j = j+1;
        end;
    end;
    if provokasi_SangatTinggi ~= 0 && Emosi_Besar ~= 0
        if provokasi_SangatTinggi <= Emosi_Besar 
            Ya(j) = provokasi_SangatTinggi;
            j = j+1;
        else
            Ya(j)= Emosi_Besar;
            j = j+1;
        end;
    end;

    YaMax = max(Ya);
    TidakMax = max(Tidak);

    y = ((TidakMax*50)+(YaMax*100))/(YaMax+TidakMax);
    if y <= 50 && y > 0
        disp('TIDAK');
    elseif y > 50 && y <= 100
        disp('YA');
    end;
end