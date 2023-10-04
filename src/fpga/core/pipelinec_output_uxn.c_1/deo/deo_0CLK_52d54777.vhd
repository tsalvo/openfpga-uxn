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
-- Submodules: 90
entity deo_0CLK_52d54777 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_52d54777;
architecture arch of deo_0CLK_52d54777 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l455_c6_45b5]
signal BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l455_c1_7367]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l461_c7_8a35]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l455_c2_e241]
signal t8_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l455_c2_e241]
signal device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l455_c2_e241]
signal n8_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l455_c2_e241]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l455_c2_e241]
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l455_c2_e241]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l455_c2_e241]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l455_c2_e241]
signal result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l455_c2_e241]
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l455_c2_e241]
signal result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l455_c2_e241]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l455_c2_e241]
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l455_c2_e241]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l455_c2_e241]
signal result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l455_c2_e241]
signal result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(1 downto 0);

-- printf_uxn_opcodes_h_l456_c3_e271[uxn_opcodes_h_l456_c3_e271]
signal printf_uxn_opcodes_h_l456_c3_e271_uxn_opcodes_h_l456_c3_e271_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l461_c11_632f]
signal BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l464_c7_86ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l461_c7_8a35]
signal t8_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l461_c7_8a35]
signal device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l461_c7_8a35]
signal n8_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l461_c7_8a35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l461_c7_8a35]
signal result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l461_c7_8a35]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l461_c7_8a35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l461_c7_8a35]
signal result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l461_c7_8a35]
signal result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l461_c7_8a35]
signal result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l461_c7_8a35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l461_c7_8a35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l461_c7_8a35]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l461_c7_8a35]
signal result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l461_c7_8a35]
signal result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l464_c11_2594]
signal BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l468_c7_20b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l464_c7_86ec]
signal t8_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l464_c7_86ec]
signal device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l464_c7_86ec]
signal n8_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l464_c7_86ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l464_c7_86ec]
signal result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l464_c7_86ec]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l464_c7_86ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l464_c7_86ec]
signal result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l464_c7_86ec]
signal result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l464_c7_86ec]
signal result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l464_c7_86ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l464_c7_86ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l464_c7_86ec]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l464_c7_86ec]
signal result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l464_c7_86ec]
signal result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l468_c11_f28d]
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l471_c7_9e59]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l468_c7_20b4]
signal device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l468_c7_20b4]
signal n8_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l468_c7_20b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l468_c7_20b4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l468_c7_20b4]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l468_c7_20b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l468_c7_20b4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l468_c7_20b4]
signal result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(7 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l468_c7_20b4]
signal result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l468_c7_20b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l468_c7_20b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l468_c7_20b4]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l468_c7_20b4]
signal result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l468_c7_20b4]
signal result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l471_c11_817a]
signal BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c1_9d1c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l471_c7_9e59]
signal device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l471_c7_9e59]
signal n8_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l471_c7_9e59]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l471_c7_9e59]
signal result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l471_c7_9e59]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l471_c7_9e59]
signal result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l471_c7_9e59]
signal result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l471_c7_9e59]
signal result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l471_c7_9e59]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l471_c7_9e59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l471_c7_9e59]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l471_c7_9e59]
signal result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l471_c7_9e59]
signal result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l475_c32_5a8f]
signal BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l475_c32_7a44]
signal BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l475_c32_6517]
signal MUX_uxn_opcodes_h_l475_c32_6517_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l475_c32_6517_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l475_c32_6517_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l475_c32_6517_return_output : signed(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l479_c42_cd91]
signal BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l479_c23_ac69]
signal device_out_uxn_opcodes_h_l479_c23_ac69_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l479_c23_ac69_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l479_c23_ac69_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l479_c23_ac69_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l479_c23_ac69_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l479_c23_ac69_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.device_ram_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.is_device_ram_read := ref_toks_10;
      base.vram_address := ref_toks_11;
      base.vram_value := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5
BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_left,
BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_right,
BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- t8_MUX_uxn_opcodes_h_l455_c2_e241
t8_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l455_c2_e241_cond,
t8_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
t8_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
t8_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l455_c2_e241
device_out_result_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_cond,
device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- n8_MUX_uxn_opcodes_h_l455_c2_e241
n8_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l455_c2_e241_cond,
n8_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
n8_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
n8_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241
result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241
result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241
result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241
result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241
result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_cond,
result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241
result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_cond,
result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

-- printf_uxn_opcodes_h_l456_c3_e271_uxn_opcodes_h_l456_c3_e271
printf_uxn_opcodes_h_l456_c3_e271_uxn_opcodes_h_l456_c3_e271 : entity work.printf_uxn_opcodes_h_l456_c3_e271_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l456_c3_e271_uxn_opcodes_h_l456_c3_e271_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f
BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_left,
BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_right,
BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- t8_MUX_uxn_opcodes_h_l461_c7_8a35
t8_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
t8_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
t8_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
t8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35
device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- n8_MUX_uxn_opcodes_h_l461_c7_8a35
n8_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
n8_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
n8_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
n8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35
result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35
result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35
result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35
result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35
result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35
result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35
result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35
result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35
result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35
result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_cond,
result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594
BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_left,
BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_right,
BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- t8_MUX_uxn_opcodes_h_l464_c7_86ec
t8_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
t8_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
t8_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
t8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec
device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- n8_MUX_uxn_opcodes_h_l464_c7_86ec
n8_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
n8_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
n8_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
n8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec
result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec
result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec
result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec
result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec
result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_cond,
result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d
BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_left,
BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_right,
BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4
device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- n8_MUX_uxn_opcodes_h_l468_c7_20b4
n8_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
n8_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
n8_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
n8_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4
result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4
result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4
result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4
result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4
result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4
result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4
result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4
result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4
result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_cond,
result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a
BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_left,
BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_right,
BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59
device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- n8_MUX_uxn_opcodes_h_l471_c7_9e59
n8_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
n8_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
n8_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
n8_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59
result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59
result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59
result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59
result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59
result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59
result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59
result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59
result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59
result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59
result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59
result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_cond,
result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f
BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_left,
BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_right,
BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44
BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_left,
BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_right,
BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_return_output);

-- MUX_uxn_opcodes_h_l475_c32_6517
MUX_uxn_opcodes_h_l475_c32_6517 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l475_c32_6517_cond,
MUX_uxn_opcodes_h_l475_c32_6517_iftrue,
MUX_uxn_opcodes_h_l475_c32_6517_iffalse,
MUX_uxn_opcodes_h_l475_c32_6517_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91
BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_left,
BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_right,
BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_return_output);

-- device_out_uxn_opcodes_h_l479_c23_ac69
device_out_uxn_opcodes_h_l479_c23_ac69 : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l479_c23_ac69_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l479_c23_ac69_device_address,
device_out_uxn_opcodes_h_l479_c23_ac69_value,
device_out_uxn_opcodes_h_l479_c23_ac69_phase,
device_out_uxn_opcodes_h_l479_c23_ac69_previous_device_ram_read,
device_out_uxn_opcodes_h_l479_c23_ac69_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 t8_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 n8_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 t8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 n8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 t8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 n8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 n8_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_return_output,
 device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 n8_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output,
 BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_return_output,
 MUX_uxn_opcodes_h_l475_c32_6517_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_return_output,
 device_out_uxn_opcodes_h_l479_c23_ac69_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l458_c3_b6ea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l456_c3_e271_uxn_opcodes_h_l456_c3_e271_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_d4e9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l466_c3_f0c0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c3_4000 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_20b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c32_6517_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c32_6517_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c32_6517_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l475_c32_6517_return_output : signed(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l479_c23_ac69_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l479_c23_ac69_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l479_c23_ac69_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l479_c23_ac69_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l479_c23_ac69_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l479_c23_ac69_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l480_c32_76e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l481_c31_2f73_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l482_c31_c877_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l483_c29_2b25_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l484_c26_b41a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l485_c25_dbb6_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l486_c23_6214_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l487_c24_a76c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l468_l455_DUPLICATE_65c4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_3f4c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_c75f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_7f02_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_58a0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_dd27_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_5bff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_a745_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_1dd8_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_2307_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_3dd0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c_uxn_opcodes_h_l450_l490_DUPLICATE_5424_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l466_c3_f0c0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l466_c3_f0c0;
     VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l458_c3_b6ea := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l458_c3_b6ea;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c3_4000 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l469_c3_4000;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l475_c32_6517_iffalse := resize(to_signed(-2, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_right := to_unsigned(3, 2);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l475_c32_6517_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_d4e9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l462_c3_d4e9;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := to_unsigned(0, 1);

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
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l479_c23_ac69_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l479_c23_ac69_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l479_c23_ac69_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_5bff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_5bff_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l464_c11_2594] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_left;
     BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output := BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_58a0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_58a0_return_output := result.device_ram_value;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_1dd8 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_1dd8_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_c75f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_c75f_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l468_c11_f28d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_left;
     BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output := BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l461_c11_632f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_left;
     BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output := BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l455_c6_45b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_3f4c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_3f4c_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l471_c11_817a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_left;
     BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output := BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l468_l455_DUPLICATE_65c4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l468_l455_DUPLICATE_65c4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_3dd0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_3dd0_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_2307 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_2307_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_7f02 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_7f02_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_a745 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_a745_return_output := result.vram_address;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_20b4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_MINUS[uxn_opcodes_h_l479_c42_cd91] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_left;
     BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_return_output := BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l475_c32_5a8f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_left;
     BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_return_output := BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_dd27 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_dd27_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_left := VAR_BIN_OP_AND_uxn_opcodes_h_l475_c32_5a8f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_e241_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l455_c6_45b5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l461_c7_8a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l461_c11_632f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l464_c7_86ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l464_c11_2594_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l468_c11_f28d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l471_c11_817a_return_output;
     VAR_device_out_uxn_opcodes_h_l479_c23_ac69_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l479_c42_cd91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_dd27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_dd27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_dd27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_dd27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_dd27_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_5bff_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_5bff_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_5bff_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_5bff_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_5bff_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_c75f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_c75f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_c75f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_c75f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_c75f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_3dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_3dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_3dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_3dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l468_l455_DUPLICATE_65c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l468_l455_DUPLICATE_65c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l468_l455_DUPLICATE_65c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l461_l464_l468_l455_DUPLICATE_65c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_2307_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_2307_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_2307_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l471_l461_l464_l468_DUPLICATE_2307_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_3f4c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_3f4c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_3f4c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_3f4c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_3f4c_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_1dd8_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_1dd8_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_1dd8_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_1dd8_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_1dd8_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_a745_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_a745_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_a745_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_a745_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_a745_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_7f02_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_7f02_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_7f02_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_7f02_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_7f02_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_58a0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_58a0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_58a0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_58a0_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l461_l471_l455_l464_l468_DUPLICATE_58a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l468_c7_20b4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l475_c32_7a44] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_left;
     BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_return_output := BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_return_output;

     -- t8_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_t8_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     t8_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     t8_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := t8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l455_c1_7367] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_return_output;

     -- n8_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_n8_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     n8_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     n8_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := n8_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l475_c32_6517_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l475_c32_7a44_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     VAR_printf_uxn_opcodes_h_l456_c3_e271_uxn_opcodes_h_l456_c3_e271_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l455_c1_7367_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_t8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     -- printf_uxn_opcodes_h_l456_c3_e271[uxn_opcodes_h_l456_c3_e271] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l456_c3_e271_uxn_opcodes_h_l456_c3_e271_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l456_c3_e271_uxn_opcodes_h_l456_c3_e271_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- t8_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_t8_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     t8_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     t8_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := t8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- MUX[uxn_opcodes_h_l475_c32_6517] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l475_c32_6517_cond <= VAR_MUX_uxn_opcodes_h_l475_c32_6517_cond;
     MUX_uxn_opcodes_h_l475_c32_6517_iftrue <= VAR_MUX_uxn_opcodes_h_l475_c32_6517_iftrue;
     MUX_uxn_opcodes_h_l475_c32_6517_iffalse <= VAR_MUX_uxn_opcodes_h_l475_c32_6517_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l475_c32_6517_return_output := MUX_uxn_opcodes_h_l475_c32_6517_return_output;

     -- n8_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_n8_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     n8_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     n8_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := n8_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue := VAR_MUX_uxn_opcodes_h_l475_c32_6517_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_n8_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_t8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- t8_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_t8_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     t8_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     t8_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l455_c2_e241_return_output := t8_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- n8_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_n8_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     n8_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     n8_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := n8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_n8_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l455_c2_e241_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- n8_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_n8_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     n8_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     n8_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := n8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_n8_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- n8_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_n8_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     n8_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     n8_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l455_c2_e241_return_output := n8_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l477_c1_9d1c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l479_c23_ac69_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l477_c1_9d1c_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l455_c2_e241_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     -- device_out[uxn_opcodes_h_l479_c23_ac69] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l479_c23_ac69_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l479_c23_ac69_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l479_c23_ac69_device_address <= VAR_device_out_uxn_opcodes_h_l479_c23_ac69_device_address;
     device_out_uxn_opcodes_h_l479_c23_ac69_value <= VAR_device_out_uxn_opcodes_h_l479_c23_ac69_value;
     device_out_uxn_opcodes_h_l479_c23_ac69_phase <= VAR_device_out_uxn_opcodes_h_l479_c23_ac69_phase;
     device_out_uxn_opcodes_h_l479_c23_ac69_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l479_c23_ac69_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l479_c23_ac69_return_output := device_out_uxn_opcodes_h_l479_c23_ac69_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := VAR_device_out_uxn_opcodes_h_l479_c23_ac69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l480_c32_76e3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l480_c32_76e3_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_ac69_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l485_c25_dbb6] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l485_c25_dbb6_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_ac69_return_output.vram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l482_c31_c877] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l482_c31_c877_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_ac69_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l481_c31_2f73] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l481_c31_2f73_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_ac69_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l487_c24_a76c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l487_c24_a76c_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_ac69_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l483_c29_2b25] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l483_c29_2b25_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_ac69_return_output.device_ram_value;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l486_c23_6214] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l486_c23_6214_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_ac69_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l484_c26_b41a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l484_c26_b41a_return_output := VAR_device_out_uxn_opcodes_h_l479_c23_ac69_return_output.is_vram_write;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l487_c24_a76c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l481_c31_2f73_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l480_c32_76e3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l484_c26_b41a_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l486_c23_6214_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l485_c25_dbb6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l482_c31_c877_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l483_c29_2b25_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l471_c7_9e59] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_cond;
     result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output := result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l471_c7_9e59_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l468_c7_20b4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l468_c7_20b4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l464_c7_86ec] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l464_c7_86ec_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_return_output := device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l461_c7_8a35] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l455_c2_e241_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l461_c7_8a35_return_output;
     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output := result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l455_c2_e241] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_cond;
     result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output := result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c_uxn_opcodes_h_l450_l490_DUPLICATE_5424 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c_uxn_opcodes_h_l450_l490_DUPLICATE_5424_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l455_c2_e241_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l455_c2_e241_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c_uxn_opcodes_h_l450_l490_DUPLICATE_5424_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c4c_uxn_opcodes_h_l450_l490_DUPLICATE_5424_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
