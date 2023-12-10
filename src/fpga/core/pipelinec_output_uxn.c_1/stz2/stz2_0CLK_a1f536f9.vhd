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
-- Submodules: 61
entity stz2_0CLK_a1f536f9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_a1f536f9;
architecture arch of stz2_0CLK_a1f536f9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1529_c6_9e52]
signal BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1529_c2_986c]
signal n16_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1529_c2_986c]
signal result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1529_c2_986c]
signal result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1529_c2_986c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1529_c2_986c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1529_c2_986c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1529_c2_986c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1529_c2_986c]
signal t8_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1536_c11_540f]
signal BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1536_c7_50b8]
signal n16_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1536_c7_50b8]
signal result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1536_c7_50b8]
signal result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1536_c7_50b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1536_c7_50b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1536_c7_50b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1536_c7_50b8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1536_c7_50b8]
signal t8_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_9773]
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1539_c7_1325]
signal n16_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1539_c7_1325]
signal result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1539_c7_1325]
signal result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1539_c7_1325]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_1325]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1539_c7_1325]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1539_c7_1325]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1539_c7_1325]
signal t8_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1543_c11_978e]
signal BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1543_c7_410b]
signal n16_MUX_uxn_opcodes_h_l1543_c7_410b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1543_c7_410b_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1543_c7_410b]
signal result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1543_c7_410b]
signal result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1543_c7_410b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1543_c7_410b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1543_c7_410b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1545_c3_c620]
signal CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1547_c11_e14f]
signal BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1547_c7_ca47]
signal n16_MUX_uxn_opcodes_h_l1547_c7_ca47_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1547_c7_ca47]
signal result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1547_c7_ca47]
signal result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1547_c7_ca47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1547_c7_ca47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1547_c7_ca47]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1548_c3_1e61]
signal BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1550_c30_d57e]
signal sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1553_c31_07f7]
signal CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1555_c11_4124]
signal BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1555_c7_7450]
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1555_c7_7450]
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1555_c7_7450]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1555_c7_7450]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1555_c7_7450]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1557_c33_e9ae]
signal BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1560_c11_aec5]
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c7_4e65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1560_c7_4e65]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_ram_write := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52
BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_left,
BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_right,
BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output);

-- n16_MUX_uxn_opcodes_h_l1529_c2_986c
n16_MUX_uxn_opcodes_h_l1529_c2_986c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1529_c2_986c_cond,
n16_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue,
n16_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse,
n16_MUX_uxn_opcodes_h_l1529_c2_986c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c
result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c
result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c
result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_return_output);

-- t8_MUX_uxn_opcodes_h_l1529_c2_986c
t8_MUX_uxn_opcodes_h_l1529_c2_986c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1529_c2_986c_cond,
t8_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue,
t8_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse,
t8_MUX_uxn_opcodes_h_l1529_c2_986c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f
BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_left,
BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_right,
BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output);

-- n16_MUX_uxn_opcodes_h_l1536_c7_50b8
n16_MUX_uxn_opcodes_h_l1536_c7_50b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1536_c7_50b8_cond,
n16_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue,
n16_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse,
n16_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8
result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8
result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8
result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output);

-- t8_MUX_uxn_opcodes_h_l1536_c7_50b8
t8_MUX_uxn_opcodes_h_l1536_c7_50b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1536_c7_50b8_cond,
t8_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue,
t8_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse,
t8_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_left,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_right,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output);

-- n16_MUX_uxn_opcodes_h_l1539_c7_1325
n16_MUX_uxn_opcodes_h_l1539_c7_1325 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1539_c7_1325_cond,
n16_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue,
n16_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse,
n16_MUX_uxn_opcodes_h_l1539_c7_1325_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325
result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_cond,
result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325
result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_cond,
result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_return_output);

-- t8_MUX_uxn_opcodes_h_l1539_c7_1325
t8_MUX_uxn_opcodes_h_l1539_c7_1325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1539_c7_1325_cond,
t8_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue,
t8_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse,
t8_MUX_uxn_opcodes_h_l1539_c7_1325_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_left,
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_right,
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_return_output);

-- n16_MUX_uxn_opcodes_h_l1543_c7_410b
n16_MUX_uxn_opcodes_h_l1543_c7_410b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1543_c7_410b_cond,
n16_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue,
n16_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse,
n16_MUX_uxn_opcodes_h_l1543_c7_410b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b
result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b
result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b
result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1545_c3_c620
CONST_SL_8_uxn_opcodes_h_l1545_c3_c620 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_x,
CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_left,
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_right,
BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_return_output);

-- n16_MUX_uxn_opcodes_h_l1547_c7_ca47
n16_MUX_uxn_opcodes_h_l1547_c7_ca47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1547_c7_ca47_cond,
n16_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue,
n16_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse,
n16_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47
result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_cond,
result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47
result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_cond,
result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47
result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61
BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_left,
BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_right,
BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e
sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_ins,
sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_x,
sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_y,
sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7
CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_x,
CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124
BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_left,
BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_right,
BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450
result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_cond,
result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450
result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_cond,
result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450
result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae
BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_left,
BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_right,
BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_left,
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_right,
BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65
result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output,
 n16_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
 t8_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output,
 n16_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output,
 t8_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output,
 n16_MUX_uxn_opcodes_h_l1539_c7_1325_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_return_output,
 t8_MUX_uxn_opcodes_h_l1539_c7_1325_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_return_output,
 n16_MUX_uxn_opcodes_h_l1543_c7_410b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_return_output,
 CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_return_output,
 n16_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_return_output,
 sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_return_output,
 CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1533_c3_a4a8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1529_c2_986c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1529_c2_986c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1537_c3_e175 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1536_c7_50b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1543_c7_410b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1541_c3_4368 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1539_c7_1325_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1539_c7_1325_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1543_c7_410b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1547_c7_ca47_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1552_c22_cfc7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1553_c21_861e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1556_c3_2043 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1557_c22_19de_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1558_c21_e37b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_23ec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_89ef_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_c8a8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1560_l1529_DUPLICATE_6d4d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1555_l1547_l1543_l1539_l1536_l1560_DUPLICATE_03ca_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1544_l1548_DUPLICATE_5ade_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1523_l1565_DUPLICATE_6cee_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1533_c3_a4a8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1533_c3_a4a8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1541_c3_4368 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1541_c3_4368;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1537_c3_e175 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1537_c3_e175;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1556_c3_2043 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1556_c3_2043;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1555_l1547_l1543_l1539_l1536_l1560_DUPLICATE_03ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1555_l1547_l1543_l1539_l1536_l1560_DUPLICATE_03ca_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_c8a8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_c8a8_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1550_c30_d57e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_ins;
     sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_x;
     sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_return_output := sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1558_c21_e37b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1558_c21_e37b_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_9773] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_left;
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output := BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1544_l1548_DUPLICATE_5ade LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1544_l1548_DUPLICATE_5ade_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1560_l1529_DUPLICATE_6d4d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1560_l1529_DUPLICATE_6d4d_return_output := result.is_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1557_c33_e9ae] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1560_c11_aec5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1539_c7_1325] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1539_c7_1325_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1536_c11_540f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1547_c11_e14f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1552_c22_cfc7] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1552_c22_cfc7_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_89ef LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_89ef_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1529_c6_9e52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_left;
     BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output := BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_23ec LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_23ec_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1555_c11_4124] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_left;
     BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_return_output := BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1543_c11_978e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1529_c2_986c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1529_c2_986c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c6_9e52_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1536_c7_50b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1536_c7_50b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1536_c11_540f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1539_c7_1325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1539_c7_1325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_9773_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1543_c7_410b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_978e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1547_c7_ca47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1547_c11_e14f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1555_c11_4124_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c11_aec5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1552_c22_cfc7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1544_l1548_DUPLICATE_5ade_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1544_l1548_DUPLICATE_5ade_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1558_c21_e37b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_c8a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_c8a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_c8a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_c8a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_c8a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_23ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_23ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_23ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_23ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_23ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1555_l1547_l1543_l1539_l1536_l1560_DUPLICATE_03ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1555_l1547_l1543_l1539_l1536_l1560_DUPLICATE_03ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1555_l1547_l1543_l1539_l1536_l1560_DUPLICATE_03ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1555_l1547_l1543_l1539_l1536_l1560_DUPLICATE_03ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1555_l1547_l1543_l1539_l1536_l1560_DUPLICATE_03ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1555_l1547_l1543_l1539_l1536_l1560_DUPLICATE_03ca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1560_l1529_DUPLICATE_6d4d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1560_l1529_DUPLICATE_6d4d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1560_l1529_DUPLICATE_6d4d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1560_l1529_DUPLICATE_6d4d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1560_l1529_DUPLICATE_6d4d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1560_l1529_DUPLICATE_6d4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_89ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_89ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_89ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_89ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1555_l1543_l1539_l1536_l1529_DUPLICATE_89ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1539_c7_1325_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1550_c30_d57e_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1545_c3_c620] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_return_output := CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1560_c7_4e65] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output;

     -- t8_MUX[uxn_opcodes_h_l1539_c7_1325] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1539_c7_1325_cond <= VAR_t8_MUX_uxn_opcodes_h_l1539_c7_1325_cond;
     t8_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue;
     t8_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1539_c7_1325_return_output := t8_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1548_c3_1e61] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_left;
     BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_return_output := BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1555_c7_7450] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output := result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1557_c22_19de] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1557_c22_19de_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1557_c33_e9ae_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1555_c7_7450] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c7_4e65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1539_c7_1325] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1548_c3_1e61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1557_c22_19de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1545_c3_c620_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1560_c7_4e65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1555_c7_7450_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1536_c7_50b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1536_c7_50b8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1536_c7_50b8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1536_c7_50b8_cond;
     t8_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue;
     t8_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output := t8_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1555_c7_7450] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1547_c7_ca47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1553_c31_07f7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_return_output := CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1555_c7_7450] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_return_output;

     -- n16_MUX[uxn_opcodes_h_l1547_c7_ca47] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1547_c7_ca47_cond <= VAR_n16_MUX_uxn_opcodes_h_l1547_c7_ca47_cond;
     n16_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue;
     n16_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output := n16_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1555_c7_7450] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output := result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1555_c7_7450_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1555_c7_7450_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1555_c7_7450_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;
     -- n16_MUX[uxn_opcodes_h_l1543_c7_410b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1543_c7_410b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1543_c7_410b_cond;
     n16_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue;
     n16_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1543_c7_410b_return_output := n16_MUX_uxn_opcodes_h_l1543_c7_410b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1547_c7_ca47] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1543_c7_410b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1547_c7_ca47] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output := result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output;

     -- t8_MUX[uxn_opcodes_h_l1529_c2_986c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1529_c2_986c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1529_c2_986c_cond;
     t8_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue;
     t8_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1529_c2_986c_return_output := t8_MUX_uxn_opcodes_h_l1529_c2_986c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1547_c7_ca47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1553_c21_861e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1553_c21_861e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1553_c31_07f7_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1529_c2_986c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1553_c21_861e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1543_c7_410b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_410b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1529_c2_986c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1547_c7_ca47] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output := result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1543_c7_410b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1539_c7_1325] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1543_c7_410b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1543_c7_410b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1539_c7_1325] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1539_c7_1325_cond <= VAR_n16_MUX_uxn_opcodes_h_l1539_c7_1325_cond;
     n16_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue;
     n16_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1539_c7_1325_return_output := n16_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_410b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1543_c7_410b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1547_c7_ca47_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1536_c7_50b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1539_c7_1325] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1543_c7_410b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1536_c7_50b8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1536_c7_50b8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1536_c7_50b8_cond;
     n16_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue;
     n16_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output := n16_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1539_c7_1325] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output := result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_1325] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1543_c7_410b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1529_c2_986c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1536_c7_50b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1536_c7_50b8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1536_c7_50b8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1529_c2_986c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1529_c2_986c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1529_c2_986c_cond;
     n16_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue;
     n16_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1529_c2_986c_return_output := n16_MUX_uxn_opcodes_h_l1529_c2_986c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1539_c7_1325] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output := result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1529_c2_986c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1539_c7_1325_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1529_c2_986c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1529_c2_986c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1536_c7_50b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1529_c2_986c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1536_c7_50b8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1529_c2_986c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1523_l1565_DUPLICATE_6cee LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1523_l1565_DUPLICATE_6cee_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c2_986c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1529_c2_986c_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1523_l1565_DUPLICATE_6cee_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1523_l1565_DUPLICATE_6cee_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
