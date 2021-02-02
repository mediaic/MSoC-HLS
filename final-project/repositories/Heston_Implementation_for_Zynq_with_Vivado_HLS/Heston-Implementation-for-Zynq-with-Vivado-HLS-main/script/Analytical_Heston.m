
%ANALYTICAL_HESTON Summary of this function goes here
%   Detailed explanation goes here
spot_price = 100;
vola_0     = 0.04;
riskless_rate = 0;
dividend_rate = 0;
reversion_rate = 0.5;
long_term_avg_vol = 0.04;
vol_of_vol = 1;
OptSpec = 1;
correlation = 0;
Strike_price = 100;
if(OptSpec == 1) % OptSpec: 1-call, 2-put
    OptSpec = 'call';
else
    OptSpec = 'put';
end

% Define RateSpec
T_year = 1;
T_day = 0;
Settle = datetime(2019,1,1);
Maturity = Settle + calyears(T_year) + caldays(T_day);
fprintf("Settle date:   %s\n", Settle);
fprintf("Maturity date: %s\n", Maturity);

OptExer = 1;
% Option price by Heston model using numerical integration
if(OptExer == 1) % OptExer: 1-Euro, 2-Amer
    Price_Heston = optByHestonNI(riskless_rate, spot_price, Settle, Maturity, OptSpec, Strike_price, vola_0, long_term_avg_vol, reversion_rate, ...
                                 vol_of_vol, correlation, 'DividendYield', dividend_rate, 'Basis', 3);
elseif(OptExer == 2)
    Price_Heston = optByHestonFD(riskless_rate, spot_price, Settle, Maturity, OptSpec, Strike_price, vola_0, long_term_avg_vol, reversion_rate, ...
                                 vol_of_vol, correlation, 'DividendYield', dividend_rate, 'Basis', 3, 'AmericanOpt', 1);%, 'AssetGridSize', 512, 'VarianceGridSize', 512, 'TimeGridSize', 500);
end

fprintf("Heston price is: %.9f\n", Price_Heston);