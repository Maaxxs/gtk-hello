public class MyApp : Gtk.Application {

    public MyApp () {
        Object (
            application_id: "com.github.maaxxs.gtk-hello",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var grid = new Gtk.Grid ();
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.set_border_width (16);
        grid.row_spacing = 6;
        grid.column_spacing = 6;

        var hello_button = new Gtk.Button.with_label (_("Say Hello"));
        var hello_label = new Gtk.Label (null);
        
        var rotate_button = new Gtk.Button.with_label (_("Rotate"));
        var rotate_label = new Gtk.Label (_("Horizontal"));

        hello_button.clicked.connect (() => {
            hello_label.label = _("Hello World!");
            hello_button.sensitive = false;
        });
        
        rotate_button.clicked.connect (() => {
            rotate_label.angle = 90;
            rotate_label.label = _("Vertical");
            rotate_button.sensitive = false;
        });


        grid.attach (hello_button, 0, 0);
        grid.attach_next_to (hello_label, hello_button, Gtk.PositionType.RIGHT);

        grid.attach (rotate_button, 0, 1);
        grid.attach_next_to (rotate_label, rotate_button, Gtk.PositionType.RIGHT);

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