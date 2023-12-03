close all
age_mean=mean(hospital.Age)
weight_mean=mean(hospital.Weight)
BP_1_mean=mean(hospital.BloodPressure(:,1))

age_std=std(hospital.Age)
weight_std=std(hospital.Weight)
BP_1_std=std(hospital.BloodPressure(1,:))

figure(1)
subplot(3,1,1)
histogram(hospital.Age)
title("Age histogram")
subplot(3,1,2)
histogram(hospital.Weight)
title("Weight histogram")
subplot(3,1,3)
h=histogram(hospital.BloodPressure(:,1),20)
title("Blood pressure histogram")


rozkl=fitdist(hospital.BloodPressure(:,1),"Normal");
x_values=100:0.1:150;
y_values=pdf(rozkl,x_values)*h.BinWidth*length(hospital.BloodPressure(:,1));

figure(2)
subplot(2,1,1)
histogram(hospital.BloodPressure(:,1),20)
hold on
plot(x_values,y_values)
subplot(2,1,2)
histfit(hospital.BloodPressure(:,1),20)

figure(3)
title("Age, Weight, Blood pressure boxplots")
boxplot(hospital.Age)
hold on
boxplot(hospital.Weight,"Positions",2)
hold on
boxplot(hospital.BloodPressure(:,1),"Positions",3)
set(gca(),'XTick',[1 2 3],'XTickLabels',{'Age','Weight','Blood pressure'})

figure(4)
hold on
histfit(hospital.Weight(hospital.Sex=='Male'),20,"Normal")
histfit(hospital.Weight(hospital.Sex=='Female'),20,"Normal")
legend({'Male','Male dist','Female','Female dist'})
