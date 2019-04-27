%% Clear 
clear;
clc;
%% load data

load('sus-data.mat');
data = PostTestQuestionnaireWalmartmobileappResponsesFormResponses1;

%% Extract data

odds = [1 3 5 7 9];
even = [2 4 6 8 10];

oddItems = [];
evenItems = [];
headers = data.Properties.VariableNames;
headers = headers(3:12);

q_1 = [];
q_2 = [];
q_3 = [];
q_4 = [];
q_5 = [];
q_6 = [];
q_7 = [];
q_8 = [];
q_9 = [];
q_10 = [];

%% Odds

for Idx=1:numel(odds)
    q_1 = [q_1, data.IthinkthatIwouldliketousethissystemfrequently(Idx)];
    q_2 = [q_2, data.Ifoundthesystemunnecessarilycomplex(Idx)];
    q_3 = [q_3, data.Ithoughtthesystemwaseasytouse(Idx)];
    q_4 = [q_4, data.IthinkthatIwouldneedthesupportofatechnicalpersontobeabletouseth(Idx)];
    q_5 = [q_5, data.Ifoundthevariousfunctionsinthissystemwerewellintegrated(Idx)];
    q_6 = [q_6, data.Ithoughttherewastoomuchinconsistencyinthissystem(Idx)];
    q_7 = [q_7, data.Iwouldimaginethatmostpeoplewouldlearntousethissystemveryquickly(Idx)];
    q_8 = [q_8, data.Ifoundthesystemverycumbersometouse(Idx)];
    q_9 = [q_9, data.Ifeltveryconfidentusingthesystem(Idx)];
    q_10 = [q_10, data.IneededtolearnalotofthingsbeforeIcouldgetgoingwiththissystem(Idx)];
end

%% Calculations

q_1 = q_1 - 1;
q_3 = q_3 - 1;
q_5 = q_5 - 1;
q_7 = q_7 - 1;
q_9 = q_9 - 1;

q_2 = 5 - q_2;
q_4 = 5 - q_4;
q_6 = 5 - q_6;
q_8 = 5 - q_8;
q_10 = 5 - q_10;

q_total = mean(q_1) + mean(q_2) + mean(q_3) + mean(q_4) + mean(q_5) + mean(q_6) + mean(q_7) + mean(q_8) + mean(q_9) + mean(q_10);

susScore = q_total * 2.5;
disp(susScore);
%% Plot the results

figure;

x = 1:1:10;

means = [mean(q_1) mean(q_2) mean(q_3) mean(q_4) mean(q_5) mean(q_6) mean(q_7) mean(q_8) mean(q_9) mean(q_10)];

plot(x, means);

title('Average scores for each question in SUS questionnaire');
% xlabel('Questions');
ylabel('Average score');

grid on;

set(gca,'xtick',[1:10],'xticklabel',headers,'fontsize',16);

rotateXLabels( gca(), 45 );