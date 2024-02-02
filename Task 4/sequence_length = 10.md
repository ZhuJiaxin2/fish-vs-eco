sequence_length = 10
x = []
y = []
for i in range(len(temperature) - sequence_length):
    x.append(temperature[i:i+sequence_length])
    y.append(temperature[i+sequence_length])
x = np.array(x)
y = np.array(y)

x_test = []
y_test = []
for i in range(len(test_temperature) - sequence_length):
    x_test.append(test_temperature[i:i+sequence_length])
    y_test.append(test_temperature[i+sequence_length])



def forward(self, x):
    self.hidden = tuple([each.data for each in self.hidden])
    lstm_out, self.hidden = self.lstm(x.view(len(x), 1, -1), self.hidden)
    y_pred = self.out(lstm_out.view(len(x), -1))
    return y_pred[-1]  # Only return the last output



net_lstm = SimpleLSTM(input_size=1, hidden_size=50, output_size=1)

Input_size是不是设置成10才对？