public class MyApp : Gtk.Application {

    public MyApp () {
        Object (
            application_id: "com.github.maaxxs.gtk-hello",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var label = new Gtk.Label (null);
        
        var button_hello = new Gtk.Button.with_label (_("Click me!"));
        button_hello.margin = 12;

        button_hello.clicked.connect (() => {
            label.label = _("Hello World!");
            button_hello.sensitive = false;
        });


        var grid = new Gtk.Grid ();
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.row_spacing = 6;
        grid.set_border_width (16);

        grid.add (button_hello);
        grid.add (label);

        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_height = 300;
        main_window.default_width = 300;
        main_window.title = _("Hello World");

        main_window.add (grid);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}