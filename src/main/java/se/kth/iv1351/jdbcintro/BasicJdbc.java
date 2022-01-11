/*
 * The MIT License (MIT)
 * Copyright (c) 2020 Leif Lindbäck
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction,including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so,subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package se.kth.iv1351.jdbcintro;

import java.sql.*;
import java.util.Scanner;

/**
 * A small program that illustrates how to write a simple JDBC program.
 */
public class BasicJdbc {
  private static final String INSTRUMENTS = "instrument_stock";
  private static final String RENT = "instrument_rental";
  private static final String ONGOING = "ONGOING";
  private static final String TERMINATED = "TERMINATED";
  private PreparedStatement findAllInstrument;
  private PreparedStatement rentInstrument;
  private PreparedStatement checkAllowedToRent;
  private PreparedStatement rentTermination;
  private PreparedStatement instrumentRentedOrNot;

  private void accessDB() {
    try (Connection connection = createConnection()) {

      //set auto commit false
      connection.setAutoCommit(false);

      prepareSqlStatements(connection);

      Scanner userInput = new Scanner(System.in);

      System.out.println("* Enter 1 to list all instruments of a certain kind that are available to rent"+
              "\n" +
              "* Enter 2 to rent an instrument" +
              "\n" +
              "* Enter 3 to terminate a rental"
      );

      String userChoice = userInput.next();
      if(userChoice.equals("1") || userChoice.equals("2") || userChoice.equals("3")){
        if (userChoice.equals("1")){
          listAllInstruments(connection);}

        if (userChoice.equals("2")){
          rentAnInstrument(connection);
        }

        if (userChoice.equals("3")){

          System.out.println("\n");
          System.out.println("Enter your student ID: ");
          Scanner studentIdReader = new Scanner(System.in);

          int id = studentIdReader.nextInt();

          terminateOngoingRental(id, connection);
        }
      }else
      {
        System.out.println("************************");
        System.out.println("Type 1, 2 or 3 please :)");
        System.out.println("************************");
        accessDB();
      }

    } catch (SQLException | ClassNotFoundException exc) {
      exc.printStackTrace();
    }
  }

  private Connection createConnection() throws SQLException, ClassNotFoundException {
    //Class.forName("org.postgresql.Driver");
    //return DriverManager.getConnection("jdbc:postgresql://localhost:5432/simplejdbc",
    //"postgres", "postgres");
    Class.forName("com.mysql.cj.jdbc.Driver");
    return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/project?serverTimezone=UTC",
            "root", "12344321Bb");
  }


  private void rentAnInstrument(Connection connection) throws SQLException {

    listAllInstruments(connection);

    Scanner reader = new Scanner(System.in);

    System.out.println("Enter the ID number for the desired instrument to rent  ");

    int usersWish = reader.nextInt();

    int j = 0;
    try(ResultSet allInstruments = findAllInstrument.executeQuery()) {
      while (allInstruments.next()){
        if(allInstruments.getString(5).equals(String.valueOf(usersWish)))
        {
          j++;
        }
      }
    } catch (SQLException throwable) {
      throwable.printStackTrace();
    }

    if(j > 0){
      System.out.println(" ");
      System.out.println("Instrument: " + usersWish + " is added to your rentals");

      System.out.println(" ");

      System.out.println("Enter your StudentID: ");

      int studentID = reader.nextInt();

      System.out.println(" ");

      System.out.println("Enter today's date (YYYY-MM-DD): ");

      String startDateOfRenting = reader.next();

      String s1 = String.valueOf(startDateOfRenting).substring(4);
      String s2 = String.valueOf(startDateOfRenting).substring(0,4);
      int year = Integer.parseInt(s2);
      year += 1;
      String yearToString = Integer.toString(year);
      String result = yearToString+s1;

      startRenting(usersWish, studentID, startDateOfRenting,result, connection);
    }
    else {
      System.out.println("Instrument : " + usersWish + " not found!");
    }


  }



  private void updatedList (int studentID){

    try (ResultSet isRentable = checkAllowedToRent.executeQuery()) {
      System.out.println(" ");
      System.out.println("****************** Your current rental ******************");
      System.out.println("*************************************************************");

      while (isRentable.next()) {

        if (Integer.parseInt(isRentable.getString(3)) == studentID) {

          System.out.println(
                  "instrument_id: " + isRentable.getString(5) + " | " +
                          "student_id: " + isRentable.getString(3) + " | " +
                          "date of renting: " + isRentable.getString(2) + " | "
                          + "\u001B[32m"+"status of the rental: " + isRentable.getString(6)+"\u001B[0m");

        }
      }


    } catch (SQLException throwable) {
      throwable.printStackTrace();
    }
  }

  private void terminateOngoingRental(int studentID, Connection connection) throws SQLException {
    int hits = 0;

    try (ResultSet isRentable = checkAllowedToRent.executeQuery()) {
      System.out.println(" ");
      System.out.println("****************** Your current rental ******************");
      System.out.println("*************************************************************");
      while (isRentable.next()) {

        if (Integer.parseInt(isRentable.getString(3)) == studentID && isRentable.getString(6).equals("ONGOING")) {

          System.out.println(
                  "\u001B[31m"+"Instrument ID: " + isRentable.getString(5) + " | "+"\u001B[0m" +
                          "student_id: " + isRentable.getString(3) + " | " +
                          "date of renting: " + isRentable.getString(2) + " | "
                          +"\u001B[32m"+
                          "status of the rental: " + isRentable.getString(6)
                          +"\u001B[0m"
          );
          hits++;
        }

      }

    } catch (SQLException throwable) {
      throwable.printStackTrace();
    }
    if (hits>0){
      System.out.println(" ");
      System.out.println("Enter the ID for the rented instrument that you desire to terminate: ");
      Scanner scan = new Scanner(System.in);
      int instrumentIdSelection = scan.nextInt();

      startTermination(instrumentIdSelection, studentID, connection);


      System.out.println(" ");
      System.out.println("The rented instrument = " + instrumentIdSelection + " is  terminated, type"+
              "\u001B[33m"+" check "+"\u001B[0m"+"to list your current rentals");

      Scanner reader = new Scanner(System.in);
      String verifyCmd = reader.next();

      if (verifyCmd.equals("check")){
        updatedList(studentID);
      } else accessDB();
    }

  }

  private void startTermination(int instrumentIdSelection, int studentID, Connection connection) throws SQLException {

    try (ResultSet isRentable = checkAllowedToRent.executeQuery()) {

      while (isRentable.next()) {

        if (Integer.parseInt(isRentable.getString(5)) == instrumentIdSelection && isRentable.getString(6).equals("ONGOING")) {

          rentTermination.setString(1, TERMINATED);
          rentTermination.setInt(2, instrumentIdSelection);
          rentTermination.setInt(3, studentID);
          rentTermination.executeUpdate();

          instrumentRentedOrNot.setInt(1,0);
          instrumentRentedOrNot.setString(2,String.valueOf(instrumentIdSelection));
          instrumentRentedOrNot.executeUpdate();
          connection.commit();


          System.out.println(" ");
          System.out.println("The rented instrument below is terminated!");
          System.out.println(
                  "\u001B[31m"+
                          "instrument_id: " + isRentable.getString(5) + " | " +
                          "student_id: " + isRentable.getString(3) + " | " +
                          "date of renting: " + isRentable.getString(2) + " | " +
                          "status of rental: " + isRentable.getString(6)
                          +"\u001B[0m"
          );

        }
      }
    } catch (SQLException throwable2) {
      throwable2.printStackTrace();
      connection.rollback();
    }
  }


  private void startRenting (int instrumentID, int studentID, String startDateOfRenting ,String endDateOfRenting, Connection connection) throws SQLException {

    try(ResultSet isRentable = checkAllowedToRent.executeQuery()) {

      int i = 0;

      while (isRentable.next()){

        if(Integer.parseInt(isRentable.getString(3)) == studentID && isRentable.getString(6).equals("ONGOING")){


          i++;
        }
      }

      System.out.println(" ");


      if(i <= 1){

        rentInstrument.setString(1, String.valueOf(instrumentID));
        rentInstrument.setString(2, String.valueOf(studentID));
        rentInstrument.setString(3, String.valueOf(startDateOfRenting));
        rentInstrument.setString(4, String.valueOf(endDateOfRenting));
        rentInstrument.setString(5, ONGOING);
        rentInstrument.executeUpdate();

        instrumentRentedOrNot.setInt(1,1);
        instrumentRentedOrNot.setString(2,String.valueOf(instrumentID));
        instrumentRentedOrNot.executeUpdate();
        connection.commit();
        System.out.println("DONE!");

      } else System.out.println("Your rental have reached the limit! ");


    } catch (SQLException throwable) {
      throwable.printStackTrace();
      connection.rollback();
    }
  }




  private void listAllInstruments(Connection connection) throws SQLException {
    try(ResultSet instruments = findAllInstrument.executeQuery()) {


      System.out.println("\n");
      while (instruments.next()){

        System.out.println(
                "Id: " + instruments.getString(1) + " | " +
                        "Name: " + instruments.getString(6) + " | " +
                        "\u001B[34m"+"Instrument ID: " + instruments.getString(5) + " | "+"\u001B[0m" +
                        "Brand: " + instruments.getString(2) + " | " +
                        "Price: " + instruments.getString(4) + " | "
        );
      }
      connection.commit();
    } catch (SQLException throwable) {
      connection.rollback();
      throwable.printStackTrace();
    }

  }


  private void prepareSqlStatements(Connection connection) throws SQLException {
    findAllInstrument = connection.prepareStatement("SELECT instrument_stock.* , instrument.instrument_name FROM "+INSTRUMENTS+", instrument WHERE instrument_stock.instrument_id = instrument.instr_id and is_rented = 0");
    rentInstrument = connection.prepareStatement("INSERT INTO " + RENT + "(instrument_id,student_id,renting_start_date,renting_end_date,rent_status) VALUES (?, ?, ?, ?, ?)");
    checkAllowedToRent = connection.prepareStatement("SELECT * from " + RENT);
    rentTermination = connection.prepareStatement("UPDATE " + RENT + " SET rent_status =? WHERE instrument_id =? and student_id =?");
    instrumentRentedOrNot = connection.prepareStatement("UPDATE " + INSTRUMENTS + " SET is_rented =? WHERE instrument_id =?");

  }

  public static void main(String[] args) {

    new BasicJdbc().accessDB();

  }
}
