function sp_bruite = ajout_bruit(sp, RSB_dB)
    Ps = mean(sp.^2);
    Pb = Ps / 10^(RSB_dB/10);
    bruit = sqrt(Pb) * randn(size(sp));
    sp_bruite = sp + bruit;
end
