public class MyApp : Gtk.Application {

    public MyApp () {
        Object (
            application_id: "com.github.maaxxs.gtk-hello",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var button_hello = new Gtk.Button.with_label (_("Click me!"));
        button_hello.margin = 12;

        button_hello.clicked.connect (() => {
            button_hello.label = _("Hello World!");
            button_hello.sensitive = false;
        });

        var label = new Gtk.Label (_("Label: Hello again, world!"));

        var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 6);
        box.pack_start (label);
        box.pack_start (button_hello);

        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_height = 300;
        main_window.default_width = 300;
        main_window.title = _("Hello World");

        main_window.add (box);
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}