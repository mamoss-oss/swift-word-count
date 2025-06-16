import Foundation

@main
struct Word_Counter {
    static func main() {

        guard let url = get_filepath_from_args() else {
            print("Could not get the first argument.")
            print("Provide a valid filename for word counting.")
            exit(1)
        }

        read_file(fileURL: url)

    }
}

func get_filepath_from_args() -> URL? {
    if CommandLine.arguments.count > 1 {
        let firstArgument = CommandLine.arguments[1]
        return URL(fileURLWithPath: firstArgument)

    } else {
        return nil
    }
}

func read_file(fileURL: URL) {
    do {
        let fileHandle = try FileHandle(forReadingFrom: fileURL)
        defer { try? fileHandle.close() }

        let chunkSize = 4096
        while true {
            let data = try fileHandle.read(upToCount: chunkSize)
            if let data, !data.isEmpty {
                if let chunk = String(data: data, encoding: .utf8) {
                    print(chunk, terminator: "")
                    print("\n!!!")
                }
            } else {
                break
            }
        }
    } catch {
        print("Error: \(error)")
    }
}

// if CommandLine.arguments.count > 1 {
//     let firstArgument = CommandLine.arguments[1]
//     let fileURL = URL(fileURLWithPath: firstArgument)

//     var isDir: ObjCBool = false

//     if FileManager.default.fileExists(atPath: fileURL.path, isDirectory: &isDir), !isDir.boolValue {
//         do {
//             let content = try String(contentsOf: fileURL, encoding: .utf8)
//             print("File contents:\n\(content)")
//         } catch {
//             print("Error reading file: \(error.localizedDescription)")
//         }
//     } else {
//         print("'\(firstArgument)' is not a valid file.")
//     }

// } else {
//     print("No argument provided.")
// }

// let fileURL = URL(fileURLWithPath: "path/to/your/file.txt")
// do {
//     let fileHandle = try FileHandle(forReadingFrom: fileURL)
//     defer { try? fileHandle.close() }

//     let chunkSize = 4096
//     while true {
//         let data = try fileHandle.read(upToCount: chunkSize)
//         if let data, !data.isEmpty {
//             if let chunk = String(data: data, encoding: .utf8) {
//                 print(chunk, terminator: "")
//             }
//         } else {
//             break
//         }
//     }
// } catch {
//     print("Error: \(error)")
// }
