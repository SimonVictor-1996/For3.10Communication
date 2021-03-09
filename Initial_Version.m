% seir_model_simulate.m
function seir_model_simulate()
    clear();
    N = 10000;
    I = 1; %infectious
    S = N - I; %susceptible
    R = 0; %recovered
    E = 0; %exposed

    r = 1; %接触数
    beta = 0.05; %被感染者传染
    beta_1 = 0.03; %被潜伏着传染
    alpha = 0.05; %潜伏期20天
    gamma = 0.05; %康复概率

    T = 1:300;
    for i = 1:length(T) - 1
        S(i + 1) = S(i) - r * (beta * I(i) + beta_1 * E(i)) * S(i) / N;
        E(i + 1) = E(i) + r * (beta * I(i) + beta_1 * E(i)) * S(i) / N - alpha * E(i);
        I(i + 1) = I(i) + alpha * E(i) - gamma * I(i);
        R(i + 1) = R(i) + gamma * I(i);
    end

    plot(T,S,T,E,T,I,T,R);
    grid on;
    xlabel('天'); ylabel('人数')
    legend('易感者','潜伏者','感染者','康复者')
end