-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 58
entity lth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_609876da;
architecture arch of lth2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1947_c6_82f2]
signal BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1947_c2_69fd]
signal t16_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1947_c2_69fd]
signal n16_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1947_c2_69fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1947_c2_69fd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1947_c2_69fd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1947_c2_69fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1947_c2_69fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1947_c2_69fd]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1947_c2_69fd]
signal result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1947_c2_69fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1947_c2_69fd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_ba20]
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1960_c7_3708]
signal t16_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1960_c7_3708]
signal n16_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_3708]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1960_c7_3708]
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_3708]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_3708]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_3708]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_8f00]
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1963_c7_7680]
signal t16_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1963_c7_7680]
signal n16_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_7680]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1963_c7_7680]
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_7680]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_7680]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_7680]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1968_c11_8745]
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1968_c7_d49c]
signal t16_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1968_c7_d49c]
signal n16_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1968_c7_d49c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1968_c7_d49c]
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1968_c7_d49c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1968_c7_d49c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1968_c7_d49c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1969_c3_3142]
signal BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_e31f]
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1972_c7_9df8]
signal n16_MUX_uxn_opcodes_h_l1972_c7_9df8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_9df8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1972_c7_9df8]
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1972_c7_9df8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_9df8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_9df8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1976_c11_40ca]
signal BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1976_c7_e77a]
signal n16_MUX_uxn_opcodes_h_l1976_c7_e77a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1976_c7_e77a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1976_c7_e77a]
signal result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1976_c7_e77a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1976_c7_e77a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1976_c7_e77a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1977_c3_90f0]
signal BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1978_c30_1e5f]
signal sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1981_c21_728c]
signal BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1981_c21_5949]
signal MUX_uxn_opcodes_h_l1981_c21_5949_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1981_c21_5949_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1981_c21_5949_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1981_c21_5949_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2
BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_left,
BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_right,
BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output);

-- t16_MUX_uxn_opcodes_h_l1947_c2_69fd
t16_MUX_uxn_opcodes_h_l1947_c2_69fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1947_c2_69fd_cond,
t16_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue,
t16_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse,
t16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output);

-- n16_MUX_uxn_opcodes_h_l1947_c2_69fd
n16_MUX_uxn_opcodes_h_l1947_c2_69fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1947_c2_69fd_cond,
n16_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue,
n16_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse,
n16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd
result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd
result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd
result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd
result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_left,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_right,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output);

-- t16_MUX_uxn_opcodes_h_l1960_c7_3708
t16_MUX_uxn_opcodes_h_l1960_c7_3708 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1960_c7_3708_cond,
t16_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue,
t16_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse,
t16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output);

-- n16_MUX_uxn_opcodes_h_l1960_c7_3708
n16_MUX_uxn_opcodes_h_l1960_c7_3708 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1960_c7_3708_cond,
n16_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue,
n16_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse,
n16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_cond,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_left,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_right,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output);

-- t16_MUX_uxn_opcodes_h_l1963_c7_7680
t16_MUX_uxn_opcodes_h_l1963_c7_7680 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1963_c7_7680_cond,
t16_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue,
t16_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse,
t16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output);

-- n16_MUX_uxn_opcodes_h_l1963_c7_7680
n16_MUX_uxn_opcodes_h_l1963_c7_7680 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1963_c7_7680_cond,
n16_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue,
n16_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse,
n16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_cond,
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_left,
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_right,
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output);

-- t16_MUX_uxn_opcodes_h_l1968_c7_d49c
t16_MUX_uxn_opcodes_h_l1968_c7_d49c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1968_c7_d49c_cond,
t16_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue,
t16_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse,
t16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output);

-- n16_MUX_uxn_opcodes_h_l1968_c7_d49c
n16_MUX_uxn_opcodes_h_l1968_c7_d49c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1968_c7_d49c_cond,
n16_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue,
n16_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse,
n16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142
BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_left,
BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_right,
BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_left,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_right,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_return_output);

-- n16_MUX_uxn_opcodes_h_l1972_c7_9df8
n16_MUX_uxn_opcodes_h_l1972_c7_9df8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1972_c7_9df8_cond,
n16_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue,
n16_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse,
n16_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca
BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_left,
BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_right,
BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_return_output);

-- n16_MUX_uxn_opcodes_h_l1976_c7_e77a
n16_MUX_uxn_opcodes_h_l1976_c7_e77a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1976_c7_e77a_cond,
n16_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue,
n16_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse,
n16_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a
result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a
result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a
result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0
BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_left,
BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_right,
BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f
sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_ins,
sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_x,
sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_y,
sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c
BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_left,
BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_right,
BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_return_output);

-- MUX_uxn_opcodes_h_l1981_c21_5949
MUX_uxn_opcodes_h_l1981_c21_5949 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1981_c21_5949_cond,
MUX_uxn_opcodes_h_l1981_c21_5949_iftrue,
MUX_uxn_opcodes_h_l1981_c21_5949_iffalse,
MUX_uxn_opcodes_h_l1981_c21_5949_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd
CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output,
 t16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
 n16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output,
 t16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output,
 n16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output,
 t16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output,
 n16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output,
 t16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output,
 n16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_return_output,
 n16_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_return_output,
 n16_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_return_output,
 sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_return_output,
 MUX_uxn_opcodes_h_l1981_c21_5949_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1952_c3_f938 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_db6a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_550f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_f631 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_7e68 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_9df8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1976_c7_e77a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1980_c3_4210 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1981_c21_5949_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1981_c21_5949_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1981_c21_5949_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1981_c21_5949_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_38e4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_9e58_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_83f7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_14e5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1969_l1973_l1977_DUPLICATE_b5e7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1976_l1972_DUPLICATE_7e47_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1985_l1943_DUPLICATE_4d1e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1980_c3_4210 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1980_c3_4210;
     VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1952_c3_f938 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1952_c3_f938;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_7e68 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_7e68;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_db6a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_db6a;
     VAR_MUX_uxn_opcodes_h_l1981_c21_5949_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_550f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_550f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1981_c21_5949_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_f631 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_f631;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse := t16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1947_c2_69fd_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_83f7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_83f7_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1969_l1973_l1977_DUPLICATE_b5e7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1969_l1973_l1977_DUPLICATE_b5e7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_8f00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_left;
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output := BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1978_c30_1e5f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_ins;
     sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_x;
     sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_return_output := sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_e31f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_14e5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_14e5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1968_c11_8745] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_left;
     BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output := BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1947_c6_82f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1947_c2_69fd_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_ba20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_left;
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output := BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1947_c2_69fd_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_38e4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_38e4_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1976_l1972_DUPLICATE_7e47 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1976_l1972_DUPLICATE_7e47_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1947_c2_69fd_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_9e58 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_9e58_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1976_c11_40ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1947_c2_69fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1947_c2_69fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_82f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_3708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_3708_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_ba20_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_7680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_7680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_8f00_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_d49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_d49c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_8745_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_9df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_e31f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1976_c7_e77a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_40ca_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1969_l1973_l1977_DUPLICATE_b5e7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1969_l1973_l1977_DUPLICATE_b5e7_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1969_l1973_l1977_DUPLICATE_b5e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_83f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_83f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_83f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_83f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_83f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_9e58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_9e58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_9e58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_9e58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_9e58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_14e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_14e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_14e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_14e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_14e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1976_l1972_DUPLICATE_7e47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1976_l1972_DUPLICATE_7e47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_38e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_38e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_38e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_38e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_38e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_38e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1947_c2_69fd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1947_c2_69fd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1947_c2_69fd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1947_c2_69fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_1e5f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1976_c7_e77a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1976_c7_e77a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1976_c7_e77a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1976_c7_e77a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1969_c3_3142] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_left;
     BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_return_output := BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1977_c3_90f0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_left;
     BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_return_output := BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_3142_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_90f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1974_l1965_DUPLICATE_3dcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1972_c7_9df8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1968_c7_d49c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1968_c7_d49c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_d49c_cond;
     t16_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue;
     t16_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output := t16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_9df8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_9df8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1981_c21_728c] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_left;
     BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_return_output := BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1976_c7_e77a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1976_c7_e77a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1976_c7_e77a_cond;
     n16_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue;
     n16_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output := n16_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_9df8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1981_c21_5949_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_728c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;
     -- t16_MUX[uxn_opcodes_h_l1963_c7_7680] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1963_c7_7680_cond <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_7680_cond;
     t16_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue;
     t16_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output := t16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;

     -- MUX[uxn_opcodes_h_l1981_c21_5949] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1981_c21_5949_cond <= VAR_MUX_uxn_opcodes_h_l1981_c21_5949_cond;
     MUX_uxn_opcodes_h_l1981_c21_5949_iftrue <= VAR_MUX_uxn_opcodes_h_l1981_c21_5949_iftrue;
     MUX_uxn_opcodes_h_l1981_c21_5949_iffalse <= VAR_MUX_uxn_opcodes_h_l1981_c21_5949_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1981_c21_5949_return_output := MUX_uxn_opcodes_h_l1981_c21_5949_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1968_c7_d49c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1968_c7_d49c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1972_c7_9df8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1972_c7_9df8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1972_c7_9df8_cond;
     n16_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue;
     n16_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output := n16_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1968_c7_d49c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1968_c7_d49c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue := VAR_MUX_uxn_opcodes_h_l1981_c21_5949_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_7680] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1976_c7_e77a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1960_c7_3708] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1960_c7_3708_cond <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_3708_cond;
     t16_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue;
     t16_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output := t16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;

     -- n16_MUX[uxn_opcodes_h_l1968_c7_d49c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1968_c7_d49c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_d49c_cond;
     n16_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue;
     n16_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output := n16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_7680] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_7680] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_7680] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_e77a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_3708] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;

     -- n16_MUX[uxn_opcodes_h_l1963_c7_7680] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1963_c7_7680_cond <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_7680_cond;
     n16_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue;
     n16_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output := n16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_3708] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;

     -- t16_MUX[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1947_c2_69fd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1947_c2_69fd_cond;
     t16_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue;
     t16_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output := t16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_3708] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1972_c7_9df8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_3708] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_9df8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1960_c7_3708] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1960_c7_3708_cond <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_3708_cond;
     n16_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue;
     n16_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output := n16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1968_c7_d49c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_d49c_return_output;
     -- n16_MUX[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1947_c2_69fd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1947_c2_69fd_cond;
     n16_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue;
     n16_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output := n16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1963_c7_7680] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_return_output := result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_7680_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1960_c7_3708] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_return_output := result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_3708_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1947_c2_69fd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1985_l1943_DUPLICATE_4d1e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1985_l1943_DUPLICATE_4d1e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_69fd_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1985_l1943_DUPLICATE_4d1e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1985_l1943_DUPLICATE_4d1e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
