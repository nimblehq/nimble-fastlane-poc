import ConfigurationLoader

@main
public struct FastlaneRunner {

    public static func main() {
        do {
            let project = try ConfigurationLoader().loadProjectConfiguration()
            print("Loaded configuration: \(project)")
        } catch {
            print("Failed to load configuration!")
        }
    }
}
