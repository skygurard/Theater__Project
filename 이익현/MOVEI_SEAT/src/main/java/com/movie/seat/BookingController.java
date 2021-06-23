package com.movie.seat;

import java.awt.event.ActionEvent;
import java.awt.event.MouseEvent;
import java.io.IOException;
import java.net.URL;
import java.security.GeneralSecurityException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.ResourceBundle;

import org.graalvm.compiler.phases.common.NodeCounterPhase.Stage;

import com.sun.org.apache.bcel.internal.classfile.Node;



public class BookingController implements Initializable {

    int bookedSeatsCount;



    @Override
    public void initialize(URL location, ResourceBundle resources) {

        if(!Main.isEmployee()) {
            customerDropDownList.setVisible(false); 
            customer.setVisible(false);
            giveFeedback.setVisible(true);
        }
        

        // setting the date to the current one in the default time-zone of the system
        datePicker.setValue(LocalDate.now());
        try {
            populateFilmDropDownList(new ActionEvent());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        populateTimeDropDownList(new ActionEvent());
        populateUserDropDownList(new ActionEvent());

        // setting the total number of seats to a value of 18
        totalSeatsLabel.setText("전체 좌석: 18");
        bookedSeatsCount = 0;
        Main.setSelectedSeats(new ArrayList<String>());

        // getting the most recent version of the bookings file
        Main.resetBookingList();
        Main.readJSONFile("bookingsJSON.txt");
        Main.resetEmployeeList();
        Main.readJSONFile("employeesJSON.txt");
        Main.resetCustomerList();
        Main.readJSONFile("customersJSON.txt");
        Main.resetFilmList();
        Main.readJSONFile("filmsJSON.txt");

        if (!Main.isEmployee()) {
            bookedSeatsLabel.setVisible(false);
            availableSeatsLabel.setVisible(false);
            totalSeatsLabel.setVisible(false);
        }

        // action that is fired whenever the time is changed
        timeDropDownList.setOnAction((event) -> {

            try {
                datePicker.getValue().equals(null);

                Main.getSelectedSeats().clear();

                Main.setSelectedTime(timeDropDownList.getValue());

                // resetting the number of booked seats for every date, film, and time
                bookedSeatsCount = 0;

                // resetting all seats to black every time the user selects a new screening time
                for (int i = 0; i < 18; i++) {
                    gridSeats.getChildren().get(i)
                    .setStyle("-fx-fill:black; -fx-font-family: 'Material Icons'; -fx-font-size: 40.0;");
                }


  
 
                    if (booking.getStatus().equals("예약 완료")) {
 
                        if (booking.getDate().equals(datePicker.getValue().toString())
                                && booking.getFilm().equals(filmDropDownList.getValue())
                                && booking.getTime().equals(timeDropDownList.getValue())) {

                            for (int i = 0; i < 18; i++) {
                                if (gridSeats.getChildren().get(i).getId().equals(booking.getSeat())) {
                                    gridSeats.getChildren().get(i).setStyle(
                                            "-fx-fill:#c9b3b3; -fx-font-family: 'Material Icons'; -fx-font-size: 40.0;");

                                    bookedSeatsCount++;
                                }
                            }
                        }
                    }
                }

     
                bookedSeatsLabel.setText("선택 된 좌석: " + bookedSeatsCount);
                availableSeatsLabel.setText("선택 가능한 좌석: " + (18 - bookedSeatsCount));

            } catch (NullPointerException ex) {
                ex.getStackTrace();
            }

        });
    }


    private void selectSeat(MouseEvent e) {

        // firing a pop up message if user clicks on already booked seat
        if (((Node) e.getSource()).getStyle()
                .equals("-fx-fill:#c9b3b3; -fx-font-family: 'Material Icons'; -fx-font-size: 40.0;")) {
            Alert alert = new Alert(AlertType.WARNING,
                    "The seat " + ((Node) e.getSource()).getId() + " is already booked!", ButtonType.OK);
            alert.showAndWait();
            if (alert.getResult() == ButtonType.OK) {
                alert.close();
            }
        } else {
            // turning seat back to black if it is red - unselecting it
            if (((Node) e.getSource()).getStyle()
                    .equals("-fx-fill:red; -fx-font-family: 'Material Icons'; -fx-font-size: 40.0;")) {
                ((Node) e.getSource())
                .setStyle("-fx-fill:black; -fx-font-family: 'Material Icons'; -fx-font-size: 40.0;");
                Main.getSelectedSeats().remove(((Node) e.getSource()).getId());
            }
            // turning seat red if it is black - selecting it
            else {
                ((Node) e.getSource())
                .setStyle("-fx-fill:red; -fx-font-family: 'Material Icons'; -fx-font-size: 40.0;");
                Main.getSelectedSeats().add(((Node) e.getSource()).getId());
            }
        }
    }


    private void bookSeat(MouseEvent e) throws IOException, GeneralSecurityException {

        if (Main.getSelectedSeats().size() == 0){
            throwAlert();
            return;
        }
        try {
            datePicker.getValue().equals(null);
            filmDropDownList.getValue().equals(null);
            timeDropDownList.getValue().equals(null);
            if (Main.isEmployee())
                customerDropDownList.getValue().equals(null);
        } catch(NullPointerException ex){    		
            throwAlert();
            return;
        }

        Alert alert = new Alert(AlertType.CONFIRMATION, "Do you want to proceed with the booking?", ButtonType.YES, ButtonType.NO);
        alert.showAndWait();

        if(alert.getResult() == ButtonType.NO) {
            alert.close();
            return;
        }
        else {
  
            int newBookingId = Main.getBookingList().size() + 1;
  

            for (int i = newBookingId; i < (newBookingId + Main.getSelectedSeats().size()); i++) {

                if(Main.isEmployee())
                    Main.modifyJSONFile("bookingsJSON.txt", Integer.toString(i), "username", Encryption.encrypt(customerDropDownList.getValue()));
                else
                    Main.modifyJSONFile("bookingsJSON.txt", Integer.toString(i), "username", Encryption.encrypt(Main.getCurrentUser().getUsername()));

                Main.modifyJSONFile("bookingsJSON.txt", Integer.toString(i), "date", datePicker.getValue().toString());
                Main.modifyJSONFile("bookingsJSON.txt", Integer.toString(i), "seat", Main.getSelectedSeats().get(i - newBookingId));
                Main.modifyJSONFile("bookingsJSON.txt", Integer.toString(i), "time", timeDropDownList.getValue());
                Main.modifyJSONFile("bookingsJSON.txt", Integer.toString(i), "film", filmDropDownList.getValue());
                Main.modifyJSONFile("bookingsJSON.txt", Integer.toString(i), "status", "booked");
            }

            Main.resetBookingList();
            Main.readJSONFile("bookingsJSON.txt");

            if (!Main.isEmployee()){
                SceneCreator.launchScene("/scenes/BookingSummaryScene.fxml");
                Main.getStage().centerOnScreen();
            } else {
                Alert alert1 = new Alert(AlertType.INFORMATION, "You have completed the booking for " + customerDropDownList.getValue() + "!", ButtonType.OK);
                alert1.showAndWait();
                if(alert1.getResult() == ButtonType.OK) {
                    alert1.close();
               
                }
            }
        }
    }

    static Stage getStage() {

        return stage;
    }


    private void showBookingHistoryOnClick(ActionEvent event) throws IOException {

      
    }
    

    private void giveFeedback(ActionEvent event) throws IOException {

       
    }


    private void backToPrevScene(ActionEvent event) throws IOException {

      
    }


    private void populateFilmDropDownList(ActionEvent event) throws ParseException {

        Main.resetFilmList();
        Main.readJSONFile("filmsJSON.txt");
        try {
            Main.setSelectedDate(datePicker.getValue().toString());

            ObservableList<String> filmTitles = FXCollections.observableArrayList();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            for (Film film : Main.getFilmList()) {
                if ((LocalDate.parse(film.getStartDate(), formatter).isBefore(datePicker.getValue()) ||
                        LocalDate.parse(film.getStartDate(), formatter).equals(datePicker.getValue()))
                        && (LocalDate.parse(film.getEndDate(), formatter).isAfter(datePicker.getValue()) ||
                                LocalDate.parse(film.getEndDate(), formatter).equals(datePicker.getValue())))
                    filmTitles.add(film.getTitle());
            }

            filmDropDownList.setItems(filmTitles);
        }
        catch(NullPointerException e) {
            e.getMessage();
        }
    }


    private void populateTimeDropDownList(ActionEvent event) {

        try {
            Main.setSelectedFilmTitle(filmDropDownList.getValue());
            Film selectedFilm = Main.getFilmByTitle(Main.getSelectedFilmTitle());

            ObservableList<String> timesList = FXCollections.observableArrayList(selectedFilm.getTimes());
            for (int i = 0; i< timesList.size(); i++) {
                if (timesList.get(i).equals("hh:mm")) {
                    timesList.remove(i);
                    i--;
                }
            }

            timeDropDownList.setItems(timesList);
        }
        catch (NullPointerException ex) {
            return;
        }
    }


    private void populateUserDropDownList(ActionEvent event) {

        try {
            ObservableList<String> customersList = FXCollections.observableArrayList();
            for(Customer c : Main.getCustomerList()){
                customersList.add(c.getUsername());
            }
            customerDropDownList.setItems(customersList);
        } catch(NullPointerException e) {
            return;
        }
    }


    private void throwAlert() {

        Alert alert = new Alert(AlertType.INFORMATION, "좌석이 설정 되어있는지 확인하세요!", ButtonType.OK);
        alert.showAndWait();
        if(alert.getResult() == ButtonType.OK){
            alert.close();
        }
    }
}