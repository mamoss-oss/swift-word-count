import Foundation

enum ArgumentError: Error {
    case noArgument
}

@main
struct Word_Counter {
    static func main() {
        let content: String
        do {
            let path = try get_filepath_from_args()
            content = try read_file(path)
        } catch {
            print("failed to read the file")
            print("make sure to provide it as first argument")

            exit(1)
        }

        let word_count = content.split { $0.isWhitespace }.count

        print(word_count)

    }
}

func get_filepath_from_args() throws -> String {
    if CommandLine.arguments.count > 1 {
        let firstArgument = CommandLine.arguments[1]
        return firstArgument

    } else {
        throw ArgumentError.noArgument
    }
}

func read_file(_ path: String) throws -> String {
    let url = URL(filePath: path)
    let fileHandle = try FileHandle(forReadingFrom: url)
    let data = fileHandle.readDataToEndOfFile()
    fileHandle.closeFile()
    return String(data: data, encoding: .utf8) ?? ""
}
