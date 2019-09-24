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
user_scores = [];
label_users = ["User 1", "User 2", "User 3", "User 4", "User 5"];

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

%%q_total = mean(q_1) + mean(q_2) + mean(q_3) + mean(q_4) + mean(q_5) + mean(q_6) + mean(q_7) + mean(q_8) + mean(q_9) + mean(q_10);
for Idx = 1:5
    q_total = q_1(Idx) + q_2(Idx) + q_3(Idx) + q_4(Idx) + q_5(Idx) + q_6(Idx) + q_7(Idx) + q_8(Idx) + q_9(Idx) + q_10(Idx);
    susScore = q_total * 2.5;
    disp("User " + susScore);
    user_scores = [user_scores, susScore];
end

disp(mean(user_scores));

%% Plot the results

figure;

x = 1:1:5;

hold on;
plot(x, user_scores, '-x','MarkerSize',10);
plot(3, mean(user_scores), '-o','MarkerSize',10);
errorbar(3, mean(user_scores), std(user_scores));
yline(65, '-','50th Percentile');

% Labels
txt = "47.5";
text(1,user_scores(1),txt,'FontSize',18);

txt = "17.5";
text(2,user_scores(2),txt,'FontSize',18);

txt = "30.0";
text(3,user_scores(3),txt,'FontSize',18);

txt = "67.5";
text(4,user_scores(4),txt,'FontSize',18);

txt = "82.5";
text(5,user_scores(5),txt,'FontSize',18);


txt = "Mean: 49.0";
text(3,mean(user_scores),txt,'FontSize',20);
%Label End

hold off;

title('Individual user SUS scores');
% xlabel('Questions');
ylabel('SUS Score');

grid off;

set(gca,'xtick',[1:5],'xticklabel',label_users,'fontsize',16);

rotateXLabels( gca(), 45 );