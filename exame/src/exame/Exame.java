
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.stage.FileChooser;
import javafx.stage.Stage;

public class Exame extends Application {

    TableView<Animal> table = new TableView<>();

    private final ObservableList<Animal> animais = FXCollections.observableArrayList();

    public void start(Stage stage) {

        Scene scene = new Scene(new Group());
        stage.setTitle("Exame");
        stage.setWidth(600);
        stage.setHeight(550);

        final Menu menuFile = new Menu("File");
        final MenuItem menuItemLoad = new MenuItem("Load");
        final MenuItem menuItemSave = new MenuItem("Save");
        final MenuItem menuItemExit = new MenuItem("Exit");
        menuFile.getItems().addAll(menuItemLoad, menuItemSave, menuItemExit);
        
        MenuBar menuBar = new MenuBar();
        menuBar.getMenus().addAll(menuFile);

        //--------------AÇÕES MENUITEM--------------------------
        menuItemExit.setOnAction((ActionEvent e) -> {
            Platform.exit();
        });

        menuItemLoad.setOnAction((ActionEvent e) -> {
            FileChooser fileChooser = new FileChooser();
            fileChooser.setTitle("Escolha seu CSV");
            File file = fileChooser.showOpenDialog(stage);
            String caminho = file.getPath();

            if (caminho.length() > 1) {
                BufferedReader br;
                String FieldDelimiter = ",";
                try {
                    br = new BufferedReader(new FileReader(caminho));

                    String line;
                    while ((line = br.readLine()) != null) {
                        String[] fields = line.split(FieldDelimiter, -1);
                        System.out.println(Arrays.toString(fields));
                        Animal record = new Animal(fields[0].toString(), fields[1].toString(), fields[2].toString(), fields[3].toString());
                        animais.add(record);
                    }

                } catch (FileNotFoundException ex) {
                    Logger.getLogger(Exame.class.getName())
                            .log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(Exame.class.getName())
                            .log(Level.SEVERE, null, ex);
                }

            }
        });

        menuItemSave.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent e) {
                FileChooser fileChooser = new FileChooser();
                fileChooser.setTitle("Escolha seu CSV");
                File file = fileChooser.showOpenDialog(stage);
                String caminho = file.getPath();

                if (file.exists() && file.isFile()) {
                    file.delete();
                }
                try {
                    file.createNewFile();
                } catch (IOException ex) {
                    Logger.getLogger(Exame.class.getName()).log(Level.SEVERE, null, ex);
                }

                FileWriter fileWriter = null;
                try {
                    fileWriter = new FileWriter(caminho, true);
                    for (Animal f : animais) {
                        fileWriter.append(String.valueOf(f.getAnimal()));
                        fileWriter.append(",");
                        fileWriter.append(String.valueOf(f.getRaca()));
                        fileWriter.append(",");
                        fileWriter.append(String.valueOf(f.getPeso()));
                        fileWriter.append(",");
                        fileWriter.append(String.valueOf(f.getIdade()));
                        fileWriter.append("\n");
                    }

                } catch (IOException f) {
                    
                }
                try {
                    fileWriter.flush();
                    fileWriter.close();
                    System.out.println("CSV escrito com sucesso");
                } catch (IOException g) {
                    
                    g.printStackTrace();
                }
            }
        });

        //----------------------------------------------------
        Label labelAnimal = new Label("Animal:  ");
        Label labelRaca = new Label("Raça:      ");
        Label labelPeso = new Label("Peso:      ");
        Label labelIdade = new Label("Idade:     ");
        TextField tfAnimal = new TextField();
        TextField tfRaca = new TextField();
        TextField tfPeso = new TextField();
        TextField tfIdade = new TextField();

        HBox hbAnimal = new HBox();
        hbAnimal.getChildren().addAll(labelAnimal, tfAnimal);
        hbAnimal.setSpacing(10);
        
        HBox hbRaca = new HBox();
        hbRaca.getChildren().addAll(labelRaca, tfRaca);
        hbRaca.setSpacing(10);
        
        HBox hbPeso = new HBox();
        hbPeso.getChildren().addAll(labelPeso, tfPeso);
        hbPeso.setSpacing(10);
        
        HBox hbIdade = new HBox();
        hbIdade.getChildren().addAll(labelIdade, tfIdade);
        hbIdade.setSpacing(10);
        
        TableColumn animalCol = new TableColumn("Animal");
        TableColumn racaCol = new TableColumn("Raça");
        TableColumn pesoCol = new TableColumn("Peso");
        TableColumn idadeCol = new TableColumn("Idade");

        animalCol.setCellValueFactory(new PropertyValueFactory<>("animal"));
        racaCol.setCellValueFactory(new PropertyValueFactory<>("raca"));
        pesoCol.setCellValueFactory(new PropertyValueFactory<>("peso"));
        idadeCol.setCellValueFactory(new PropertyValueFactory<>("idade"));

        table.setItems(animais);
        table.getColumns().addAll(animalCol, racaCol, pesoCol, idadeCol);

        final Label label = new Label("Adicione um animal ao petshop");
        label.setFont(new Font("Arial", 20));
        label.setAlignment(Pos.CENTER);

        //CRIAÇÃO E AÇÃO DOS BOTOES
        Button adicionar = new Button("Adicionar");
        Button remover = new Button("Remover");
        Button editar = new Button("Editar");

        adicionar.setOnAction((ActionEvent e) -> {
            System.out.println("Adicionado");
            String s1, s2, s3, s4;

            s1 = tfAnimal.getText();
            s2 = tfRaca.getText();
            s3 = tfPeso.getText();
            s4 = tfIdade.getText();

            animais.add(new Animal(s1, s2, s3, s4));

            tfAnimal.clear();
            tfIdade.clear();
            tfRaca.clear();
            tfPeso.clear();
        });

        remover.setOnAction((ActionEvent e) -> {
            System.out.println("Removido");
            int selectedIndex = table.getSelectionModel().getSelectedIndex();
            if (selectedIndex >= 0) {
                table.getItems().remove(selectedIndex);
            } else {
                System.out.println("Ninguem foi selecionado");
            }

        });

        editar.setOnAction((ActionEvent e) -> {
            System.out.println("Editado");
            int selectedIndex = table.getSelectionModel().getSelectedIndex();
            if (selectedIndex >= 0) {
                table.getItems().remove(selectedIndex);
            } else {
                System.out.println("Ninguem foi selecionado");
            }

            String s1, s2, s3, s4;

            s1 = tfAnimal.getText();
            s2 = tfRaca.getText();
            s3 = tfPeso.getText();
            s4 = tfIdade.getText();

            animais.add(selectedIndex, new Animal(s1, s2, s3, s4));

            tfAnimal.clear();
            tfIdade.clear();
            tfRaca.clear();
            tfPeso.clear();
        });

        //--------------------------------------------------
        
        HBox botoes = new HBox(10);
        botoes.getChildren().addAll(adicionar, remover, editar);

        VBox vb = new VBox(10);
        vb.getChildren().addAll(hbAnimal, hbRaca, hbPeso, hbIdade, botoes);

        HBox tableEAdd = new HBox(20);
        tableEAdd.getChildren().addAll(table, vb);

        VBox vbox = new VBox();
        vbox.setSpacing(5);
        vbox.setPadding(new Insets(50, 0, 0, 10));
        vbox.getChildren().addAll(label, tableEAdd);
        vbox.setAlignment(Pos.CENTER);

        ((Group) scene.getRoot()).getChildren().addAll(vbox, menuBar);

        stage.setScene(scene);
        stage.show();

    }

    public static void main(String[] args) {
        launch(args);
    }
}
